/* Gardenscapes 9.9.0 arm64: repair the saved balance when the garden reads it. */
typedef long i64;
__attribute__((visibility("hidden"))) extern void *game_get_player(void);
__attribute__((visibility("hidden"))) extern int game_get_int(void *);
__attribute__((visibility("hidden"))) extern void game_set_int(void *, int);
#ifdef REPAIR_TEST
extern i64 repair_syscall(i64, i64, i64, i64, i64);
#else
static i64 repair_syscall(i64 n, i64 a, i64 b, i64 c, i64 d) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    register i64 x1 __asm__("x1") = b;
    register i64 x2 __asm__("x2") = c;
    register i64 x3 __asm__("x3") = d;
    __asm__ volatile("svc #0" : "+r"(x0) : "r"(x8), "r"(x1), "r"(x2), "r"(x3) : "memory", "cc");
    return x0;
}
#endif
static int earned(void *p) { return game_get_int((char *)p + 912); }
static int spent(void *p) { return game_get_int((char *)p + 1016); }
static int balance(void *p) { return (int)((unsigned)earned(p) - (unsigned)spent(p)); }

__attribute__((visibility("hidden"))) int repair_stars(void *player) {
    if (!player) return 0;
    i64 e = earned(player), s = spent(player);
    int before = (int)((unsigned)e - (unsigned)s);
    if (e >= s || s < 0 || (e < 2 && s > 2147483645L)) return before;
    i64 uid = repair_syscall(174, 0, 0, 0, 0); /* getuid */
    if (uid < 10000 || uid > 2147483647L) return before;
    unsigned user = (unsigned)uid / 100000;
    char path[128], digits[12];
    /* A v1 completion may predate a save reload. This update authorizes one retry
       for a still-negative balance; healthy saves are never topped up. */
    const char *prefix = "/data/user/", *suffix = "/com.playrix.gardenscapes/files/.dudek-stars-repaired-v2";
    int pos = 0, count = 0;
    while (*prefix) path[pos++] = *prefix++;
    do { digits[count++] = '0' + user % 10; user /= 10; } while (user);
    while (count) path[pos++] = digits[--count];
    while (*suffix) path[pos++] = *suffix++;
    path[pos] = 0;
    /* Linux/Android ARM64 O_NOFOLLOW is 0100000, unlike x86's 00400000.
       O_RDWR | O_CREAT | O_NOFOLLOW | O_CLOEXEC; owner-only app-private file. */
    i64 fd = repair_syscall(56, -100, (i64)path, 2 | 0100 | 0100000 | 02000000, 0600);
    if (fd < 0) return before;
    if (repair_syscall(32, fd, 6, 0, 0) != 0) { /* flock LOCK_EX | LOCK_NB */
        repair_syscall(57, fd, 0, 0, 0);
        return before;
    }
    char done = 0;
    i64 size = repair_syscall(63, fd, (i64)&done, 1, 0);
    if (size != 0) {
        repair_syscall(57, fd, 0, 0, 0);
        return before;
    }
    /* Preserve legitimately earned stars/level progress. Correct the spent
       counter through the game's notifying, save-backed property setter.
       Only a corrupt earned counter below 2 needs the opposite adjustment. */
    if (e >= 2) game_set_int((char *)player + 1016, (int)e - 2);
    else game_set_int((char *)player + 912, (int)s + 2);
    int after = balance(player);
    if (after == 2) {
        done = 'D';
        if (repair_syscall(64, fd, (i64)&done, 1, 0) == 1)
            repair_syscall(82, fd, 0, 0, 0);
    }
    repair_syscall(57, fd, 0, 0, 0);
    return after; /* Never return a fabricated UI balance if the setter failed. */
}

__attribute__((visibility("hidden"))) int repair_get_stars(void) {
    return repair_stars(game_get_player());
}
