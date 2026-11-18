/* Run with an ARM64 libc/kernel ABI under qemu-aarch64. Only game properties,
   Android UID and the app-directory prefix are substituted; file syscalls are real. */
#define _GNU_SOURCE
#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/file.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/wait.h>
#include <unistd.h>
#ifndef __aarch64__
#error This test must use the target ARM64 headers and ABI, not host x86 flags.
#endif
int repair_get_stars(void);
static unsigned char player[1200];
static char directory[]="/tmp/gardens-repair-XXXXXX";
static int writes;
void *game_get_player(void) { return player; }
int game_get_int(void *p) { int v;memcpy(&v,p,4);return v; }
void game_set_int(void *p,int v) { memcpy(p,&v,4);writes++; }
static void reset(void) { int e=1272,s=2672;memcpy(player+912,&e,4);memcpy(player+1016,&s,4);writes=0; }
static void path(char *p,const char *name) { assert(snprintf(p,PATH_MAX,"%s/%s",directory,name)<PATH_MAX); }
long repair_syscall(long n,long a,long b,long c,long d) {
    if(n==SYS_getuid)return 1010123;
    if(n==SYS_openat) {
        const char *expected="/data/user/10/com.playrix.gardenscapes/files/";
        assert(strncmp((char*)b,expected,strlen(expected))==0);
        assert(a==AT_FDCWD && c==(O_RDWR|O_CREAT|O_NOFOLLOW|O_CLOEXEC) && d==0600);
        char p[PATH_MAX];path(p,(char*)b+strlen(expected));
        return syscall(n,a,p,c,d);
    }
    assert(n==SYS_flock || n==SYS_read || n==SYS_write || n==SYS_fsync || n==SYS_close);
    return syscall(n,a,b,c,d);
}
int main(void) {
    assert(mkdtemp(directory));
    char old[PATH_MAX],current[PATH_MAX],victim[PATH_MAX];
    path(old,".dudek-stars-repaired-v1");path(current,".dudek-stars-repaired-v2");path(victim,"untouched");
    int fd=open(old,O_WRONLY|O_CREAT,0600);assert(fd>=0 && write(fd,"D",1)==1);close(fd);
    reset();assert(repair_get_stars()==2 && writes==1); /* legacy D must not veto repair */
    assert(game_get_int(player+912)==1272 && game_get_int(player+1016)==1270);
    struct stat st;assert(stat(current,&st)==0 && st.st_size==1 && (st.st_mode&0777)==0600);
    fd=open(current,O_RDONLY);char done=0;assert(read(fd,&done,1)==1 && done=='D');close(fd);
    assert(repair_get_stars()==2 && writes==1);
    game_set_int(player+1016,1271);assert(repair_get_stars()==1 && writes==2);
    game_set_int(player+912,1273);assert(repair_get_stars()==2 && writes==3);
    pid_t child=fork();assert(child>=0);
    if(child==0) { reset();assert(repair_get_stars()==-1400 && writes==0);_exit(0); }
    int status;assert(waitpid(child,&status,0)==child && WIFEXITED(status) && WEXITSTATUS(status)==0);
    assert(unlink(current)==0);
    fd=open(current,O_CREAT|O_RDWR,0600);assert(fd>=0); /* empty file: interrupted attempt */
    assert(flock(fd,LOCK_EX|LOCK_NB)==0);
    reset();assert(repair_get_stars()==-1400 && writes==0); /* real contention */
    close(fd);assert(repair_get_stars()==2 && writes==1);
    assert(unlink(current)==0);
    fd=open(victim,O_WRONLY|O_CREAT,0600);assert(fd>=0);close(fd);
    assert(symlink(victim,current)==0);
    reset();assert(repair_get_stars()==-1400 && writes==0); /* real O_NOFOLLOW */
    assert(stat(victim,&st)==0 && st.st_size==0);
    unlink(current);unlink(victim);unlink(old);assert(rmdir(directory)==0);
    puts("PASS: ARM64 real file I/O, ABI flags, legacy marker, exact 2, spending/reward, process restart, empty-file retry, locking and symlink refusal");
}
