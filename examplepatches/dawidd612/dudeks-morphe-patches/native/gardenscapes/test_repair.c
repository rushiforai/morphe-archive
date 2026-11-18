#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <limits.h>
#include <stdlib.h>
int repair_stars(void *);
int repair_get_stars(void);
static unsigned char player[1200];
static int marker, failure, calls, uid=10123, checks;
static char saved_path[128];
static void set(int offset,int value) { memcpy(player+offset,&value,4); }
static void reset(int e, int s) { memset(player,0,sizeof(player));set(912,e);set(1016,s);marker=failure=calls=0;uid=10123; }
void *game_get_player(void) { return player; }
int game_get_int(void *p) { int v;memcpy(&v,p,4);return v; }
void game_set_int(void *p, int value) {
    calls++;
    if(failure==5)return;
    memcpy(p,&value,4);
    /* The real setter notifies listeners, which can read the balance again. */
    if(failure==6)assert(repair_get_stars()==2);
}
long repair_syscall(long n,long a,long b,long c,long d) {
    switch(n) {
    case 174:return uid;
    case 56:strcpy(saved_path,(char*)b);assert(d==0600);return failure==1?-13:7;
    case 32:return failure==2?-11:0;
    case 63:if(failure==3)return -5;if(marker){*(char*)b='D';return 1;}return 0;
    case 64:assert(*(char*)b=='D');if(failure==4)return -5;marker=1;return 1;
    case 57:case 82:return 0;
    default:abort();
    }
}
#define CHECK(condition) do { assert(condition);checks++; } while(0)
int main(void) {
    reset(1271,2672);CHECK(repair_get_stars()==2 && marker && calls==1);
    CHECK(game_get_int(player+912)==1271 && game_get_int(player+1016)==1269);
    CHECK(repair_get_stars()==2 && calls==1); /* reading is not a reward */
    set(1016,1270);CHECK(repair_get_stars()==1 && calls==1); /* spend normally */
    set(1016,1271);CHECK(repair_get_stars()==0 && calls==1);
    set(912,1272);CHECK(repair_get_stars()==1 && calls==1); /* normal next reward */
    set(1016,9999);CHECK(repair_get_stars()==-8727 && calls==1); /* completed v2 */
    reset(1272,2672);CHECK(repair_get_stars()==2); /* reported -1400 after level */
    reset(0,1402);CHECK(repair_get_stars()==2 && marker);
    reset(-1401,0);CHECK(repair_get_stars()==2 && marker);
    reset(1,1401);CHECK(repair_get_stars()==2 && marker);
    reset(12,10);CHECK(repair_get_stars()==2 && !marker && !calls);
    reset(10,10);CHECK(repair_get_stars()==0 && !marker && !calls);
    reset(11,10);CHECK(repair_get_stars()==1 && !marker && !calls);
    reset(0,1401);failure=1;CHECK(repair_get_stars()==-1401 && !marker && !calls);
    reset(0,1401);failure=2;CHECK(repair_get_stars()==-1401 && !marker && !calls);
    reset(0,1401);failure=3;CHECK(repair_get_stars()==-1401 && !marker && !calls);
    reset(0,1401);failure=4;CHECK(repair_get_stars()==2 && !marker);CHECK(repair_get_stars()==2 && calls==1);
    reset(0,1401);failure=5;CHECK(repair_get_stars()==-1401 && !marker); /* no fake UI */
    failure=0;CHECK(repair_get_stars()==2 && marker); /* setter failure is retryable */
    reset(1272,2672);failure=6;CHECK(repair_get_stars()==2 && calls==1);
    reset(0,1401);uid=1010123;CHECK(repair_get_stars()==2 && strstr(saved_path,"/data/user/10/")==saved_path);
    reset(0,1401);uid=-1;CHECK(repair_get_stars()==-1401 && !marker && !calls);
    reset(0,INT_MAX);CHECK(repair_get_stars()==-INT_MAX && !marker && !calls);
    reset(INT_MIN,0);CHECK(repair_get_stars()==2 && marker); /* setter avoids delta overflow */
    reset(0,1401);marker=1;CHECK(repair_get_stars()==-1401 && !calls);
    CHECK(repair_stars(NULL)==0);
    printf("PASS: %d production balance-read repair checks\n",checks);
}
