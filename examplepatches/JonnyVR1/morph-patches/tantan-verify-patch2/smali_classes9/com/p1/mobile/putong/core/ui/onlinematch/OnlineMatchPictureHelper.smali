.class public Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper$MaxSizeHashMap;
    }
.end annotation


# static fields
.field public static volatile c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper$MaxSizeHashMap;

    .line 5
    .line 6
    const/16 v1, 0x26

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper$MaxSizeHashMap;-><init>(ILl/rv50;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->a:Ljava/util/Map;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b:I

    .line 16
    .line 17
    return-void
.end method

.method public static b()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_5

    .line 30
    .line 31
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    const-string v3, "unknown_"

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LookingFor;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LookingFor;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    :goto_0
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    const-string v3, "both"

    .line 53
    .line 54
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-eqz v3, :cond_2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    const-string v1, "female"

    .line 62
    .line 63
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    :goto_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    xor-int/lit8 v1, v1, 0x1

    .line 73
    .line 74
    :goto_2
    if-eqz v1, :cond_4

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->c()Ljava/util/ArrayList;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    goto :goto_3

    .line 81
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->d()Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :goto_3
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b:I

    .line 89
    .line 90
    add-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    rem-int/lit8 v1, v1, 0x2

    .line 93
    .line 94
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b:I

    .line 95
    .line 96
    return-object v0
.end method

.method public final c()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b:I

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik41N1ZDSTRUVDdUT0lTSEZZU0JKS1IzSlc0WEc1VzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMDk2MjUxMjIyMzgwNTI4OTAzLCJhYiI6MH0.png"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik9ZNElUTTU1VUFUN1pOS0tRMkRUWUtLNzJaNk9GSTAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjg5MzkzMTExNzgzMjIyODExLCJhYiI6MH0.png"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldFQVpGRFpMWkVRV0NIU1BJMjJUNUxEVktMUkhHVDAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyMjYwMTc4NDc5ODIwMTU1MTg3LCJhYiI6MH0.png"

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNYSDU2RFpZUkxDNEM0N1ZMWUpaNVlPVFZZRVRXQjAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDQxNzM1NjE1MjEwNDg1MjkxLCJhYiI6MH0.png"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlYyWVUyUkNTM1c1Vk8yNkZEM1BOQzJPTElHSzVTNTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTI4NDg0NjQ0MzAxMzE3OTMxLCJhYiI6MH0.png"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdCTE1ONFBTNklTVVBCU1pRUE9SUEdQQjZQWTM2VyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTcwNTM3NjI1NTc3MTc5MTkxOSwiYWIiOjB9.png"

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlA3Sk5BTVZYWENBT0VUU0ZKUUdMVVlVWEozT1lKTyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTcwMDkwNjA4OTM3OTkzMTY5MSwiYWIiOjB9.png"

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldSQjQ0Rjc1TDJXNFo2SjMzS0dBTkhKM1JSQVNXWTAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTQxMTQwNjM5NTI1MTgwMjAzLCJhYiI6MH0.png"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpPWVZYSFlDRlZPMkhJWVVENlNVUUtXS1RWMkhXSDAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODUwNDA3MjgyODg0OTA4NTY3LCJhYiI6MH0.png"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVWR0tFUEdaTEpVMjVNUDZKVUdGTkRSWU9aWUI0STAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODMxNDcyNDIyNDQxMDQ4MzQzLCJhYiI6MH0.png"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlI3NkRGRktHVFlHTTRWRlBJUFlNUVhMR1RKTk5ZRjAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0MDEwOTcxNTA3NTAwNDM1NzUxLCJhYiI6MH0.png"

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFRWkJYRkFZNzY0TllQR1VUVlBLNjZKNjRZRE9PTiIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTM4ODY5NzA5MTgwMDYxOTUzNSwiYWIiOjB9.png"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IllKNllDTjU3UFhHS0NYTFlONk9BV1hWQ1VWRkVGRyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzEyNjgzOTkzNDQyMjEwODk3MSwiYWIiOjB9.png"

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJMREwzSU1YM1hFM0lHN0dJUTZaSlFZV0xDNE1SWCIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTM3NDI4NzA4NTA2Mjk0MDk1NSwiYWIiOjB9.png"

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNOVldVWVdKUExETk9PM09SNTdFUUxWR1VCVlVKNSIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NDAxMTg0MjgxNzQxNjkzMDgzOSwiYWIiOjB9.png"

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlNKNFUzNlFXQzZCREJISjJET1VEUlhHV0VYV0I3MjAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MzI0OTQzNDU5MDA1NDMwMTksImFiIjowfQ.png"

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFZRldCNjVGNzZEWENKNlBaU1lDNlVPTUFDQ1NCNjAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTUzNTU0MDQxMTM0MDAzNDk5LCJhYiI6MH0.png"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IldBQlpNR0NHWVBSQlM1UVNaSFBTVlRYVTU2VFhRTjAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTQ5Nzg2NjY3MDk0NDg4NTgzLCJhYiI6MH0.png"

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdEWVpRRlo1Tk0zWk9RSTJZRFhQWkVLQkZJQ1VXNjAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTE1MDM3OTk0Nzk0NzkzNTE1LCJhYiI6MH0.png"

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    return-object v0

    .line 106
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJCSERWR1pXTUlGUUc2U0I1QlNUTERSQUQzWkJMUTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozOTg2OTkwMTc5NjEzNjgyNDc1LCJhYiI6MH0.png"

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpFQ1VGUlpJSFNMTEVFWVM3UlY0Slk3UERTU0NSTDAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTEzNDM0MDk2MzYwNzY0MjE5LCJhYiI6MH0.png"

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhBU0hLUEJCSU5FUUlYVUxQSEpZUU5RUjZKQ0xVVDAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTU3NTE3NjI5OTY5MTE2MzEsImFiIjowfQ.png"

    .line 117
    .line 118
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdKQ1FJQkJTVUlZVjVOVDVMQ1VYWFdGWkZMRkdXWTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTYwMTQxOTc1NDE5MjM3MTM5LCJhYiI6MH0.png"

    .line 122
    .line 123
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVQUFRMWFpMVDRISlZONEtETjRDNVdQNlpLQkFZTyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjUzNjI4NTk4MDM1MDc4NDAyNywiYWIiOjB9.png"

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlJYUDdRVEdKTk5DQzM0TzRYWUFGR1VBVkhEVjNRUTAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjgwMjkwMTA2MDE0MDYxODM5LCJhYiI6MH0.png"

    .line 132
    .line 133
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjMzVFpYNzM1VVAyUEI1MzJPVlZBVzI3S04yWlNCWDAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzk3NzQ2MDkyMTE0NTUzNjM1LCJhYiI6MH0.png"

    .line 137
    .line 138
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhTU0hWRFYzWUgySDNNWFRJTjZZQUQ1Nlo2MzJBNDAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTEzMzExODIyNjEyMTQ5NTQ3LCJhYiI6MH0.png"

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IktOUVkzSTZNNDdWTVFWNE1EU1RMNktBS1UyRkU2VzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTEyNzE0MzM2Nzc2MTQ1OTYzLCJhYiI6MH0.png"

    .line 147
    .line 148
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlBTVUc0UzdRWUI1Rk1ER0dDR0FaUTQ0SkVSNkZRQTAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTI2NDI3MTM3ODMxNDkxODUxLCJhYiI6MH0.png"

    .line 152
    .line 153
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlE2U1JKQ0taRElXQkMyNVZZUkM1Q0FJSjNRR0ZSVjAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjg5NjMwODI5ODM1Mjk1MjUxLCJhYiI6MH0.png"

    .line 157
    .line 158
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdITjVXU0FXNUpPSkdMNzU0NldRTU9QUE0zMkxGWjAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTU4Mzg0MjA2NTk1NTAyODkxLCJhYiI6MH0.png"

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlZaM1NaMjQ3VE1LRzRJM1cyVTNIT1IyWkdMN1oyQjAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MTM5MjQ5NDg1OTEwNzI4MTEsImFiIjowfQ.png"

    .line 167
    .line 168
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVCNVc3VENEVkpGNUQ2QUIyMlc2SlZBSUpSSkZBTzAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDM3ODE3MjEzOTI2MzIyNzAzLCJhYiI6MH0.png"

    .line 172
    .line 173
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlFQUEVWTERZQ1lPUEc0RjY0Q1VKRUtFWFlISkxLNzAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTI0MzU5NzUzMTQ1ODA4NjgzLCJhYiI6MH0.png"

    .line 177
    .line 178
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVBRVFDN0dRNUo3NTJUMkVRNEU0NlU1VENMQ0JPVDAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjk5MTUxNDMwNDgyNjc5MzExLCJhYiI6MH0.png"

    .line 182
    .line 183
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxETkJRSVZaNFlCSzRDNVFUNktEQ0dJNEQ0N0JLSzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODUyNjI4Njc1OTU5NDcwMzQzLCJhYiI6MH0.png"

    .line 187
    .line 188
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkFOTFVGRU83UEdONFJPT0lKS0NKNEVYQ0pJSkZVUzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODQwNDY3MjU0NjQ4Njc0MzExLCJhYiI6MH0.png"

    .line 192
    .line 193
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNCV0tMWFNQUlBZWldYNVFTQkxCWFpCN1ZWNkVHMyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzE1ODY0MDI4NDg5OTQ4ODI4MywiYWIiOjB9.png"

    .line 197
    .line 198
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    return-object v0
.end method

.method public final d()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPictureHelper;->b:I

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRVWUJPRElTWUlJRUZSUDNPMlNZQTdHM0VRQlFUNSIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTQxNjAwNDc1MzA2NDM2NzY2MywiYWIiOjB9.png"

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRLUVZDNDJXR0ZFSUlNNDQ2SFhFRFJHUU1RUURWQTAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTU1MjgzNzI1MzQ1Njc0Mjc1LCJhYiI6MH0.png"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik5PN0VNQkpYTk5SR0xKS01KTjVIVkhWUjQ0UE5XTzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDE2NzExMDUzOTI1NzI0Njg3LCJhYiI6MH0.png"

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlRXUDc1U1JKQk5aNjc0VU9KSkZXM1RaRVhPNUZKUzAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTQwMjQ3MzYxNzEwMzYxMzg3LCJhYiI6MH0.png"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjRPUEhUUjY1UUxFT0tGRFVTWTRKQlVWQks1UldNQjAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNjg0NDc5Nzk4MTE2Mzc0ODI3LCJhYiI6MH0.png"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlE1RkRHUTJLTURXQUIzNkxBN1lQS0laNkpCRkkyRyIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MjU2MzgzNDQzNDY3NDEzODY1MSwiYWIiOjB9.png"

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlRUWVM0TEZISVRSM1ZYNVdTQ0M3RFNTNUU1VDQ1QzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzgxMDc5NDI4NjAyMTE0ODMxLCJhYiI6MH0.png"

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlVBQ0pFWFRWVk5CTFk3S1BJUDNWRFQ1RDdMSUw3MzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjYyNDMzNzM5NDE4NjUzNDc5LCJhYiI6MH0.png"

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJOTUQyWFFWT1dLRUJPR0w2WVRTWkE2RzRRWVRDSTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTA4NzA2NzE5MTY3MjA2NjYzLCJhYiI6MH0.png"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlREN0dCWVpFM0xYVUNYWk5KWkk0VTQ2QUtMUVJOTDAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTE5ODA5MDM1NTk0MTkzMTk1LCJhYiI6MH0.png"

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjM3QTdJWVlLUkpNWFBPNk1RTUtYNTZNSkk0UExOQjAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNjc4MTQ1OTU0NzQ3MjYyNTA3LCJhYiI6MH0.png"

    .line 61
    .line 62
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdGUEo1R05TS01ONFRJSlY3U0ozVzVUSDVYTFFJSSIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MTY3ODMzNTk3NjYzMjQxMjIwMywiYWIiOjB9.png"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkkyRUNWTTdOU1RMWUhBR0tMR0dFSVFTRFhKSU1NNzAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTExMDk5ODg5MjIyOTU2MDc1LCJhYiI6MH0.png"

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkY0Qk1MWUU2VVVQQ1hNTzJHQU1ITUJON0RJREdIVjAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTY4ODU4ODE1OTQ1NTk0MTU5LCJhYiI6MH0.png"

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkJYSVBWU1NNWEc3SDZLNVZTMjRRUE5LN1JQSjNZQTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNzA0NjU1MjQ5NzgzNTA3NDk5LCJhYiI6MH0.png"

    .line 81
    .line 82
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpLMkhDSEtXU1BSMkc2QVlRTFY1SERURlhQUFBIUDAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo3MTQ4NTU2NzMyODM1NDA4NDI3LCJhYiI6MH0.png"

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkMzRjc1WTVEWVkyWVdCWUNTUVlPVE9PWktQQ1k1WTAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODM0NDExMzQ2MTUzODcyOTExLCJhYiI6MH0.png"

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhERDM3VlNFM0dKRVo2VVJHUU5QNFRTN0hPTVZVUzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo4MzQ1MjUzNTk2OTc1ODQ5MTEsImFiIjowfQ.png"

    .line 96
    .line 97
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdMNE1IUFFYSlJOUjVCVjZFNjZPSzJFNTNKQTdFRjAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTY5NTk3NDMxODc4ODU3NTA3LCJhYiI6MH0.png"

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    return-object v0

    .line 106
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkxBSFRPM1FMVlQ1SEVBTDNJSlo0WUROUlpYUFBVMzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyODY1OTM2NTgzMTg3MDE5MzAzLCJhYiI6MH0.png"

    .line 107
    .line 108
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkhTQ0RUQlgzU0o2TjdHNExGM01FVU82T1E0Sk0zWDAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTc1Mjc1MzU5ODE2NzM1NTM1LCJhYiI6MH0.png"

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNOVzVJUFBBUkxJNjZBTVZQWU1YSUNKV0JFQTJHSCIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzQzMDAwNDIxMTM2ODg4ODg3MSwiYWIiOjB9.png"

    .line 117
    .line 118
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkozRE1IMkpBM0tDQlRENDdDUFlYMzVZWDdLWFFLQTAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTEzNTc2MDQ2MzgyMzEyNTAzLCJhYiI6MH0.png"

    .line 122
    .line 123
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjJaN1ZRRllEUk5DTVVMQlZUTEVHU0tUSTdPSEc1VzAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzA1NDAyOTA3NTk2NDk3Njc5LCJhYiI6MH0.png"

    .line 127
    .line 128
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlhCTjQyUEZYVUJUUzRZU1RJTjJPUTRWQU1TVVlZTzAxIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTc5NzgzMjc1MzE0NzQ0MTA3LCJhYiI6MH0.png"

    .line 132
    .line 133
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlRKQlgyTTZaVElUQ1pMR0tUU0tEUFhEM1Q3TjNGMzAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDI0MzgzMDU1MDM1OTkzNjQzLCJhYiI6MH0.png"

    .line 137
    .line 138
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVaWVZFVEtEVFJSUlZOUjNSUVZOVU8yUFFZSUJXVTAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzAzMTQxMzQyOTMyODA2Njk5LCJhYiI6MH0.png"

    .line 142
    .line 143
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkdDRlE3Ukk0UVBPTjZQRk82RFBHQTZRVE9ES0UySDAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTI0MzExNTY1ODE4OTI1ODY3LCJhYiI6MH0.png"

    .line 147
    .line 148
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkRHN01VU1dHQUc3V1pHSlJYNzNCREhCSEo2UjVNVTAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1MjUxMzE0NjU3NjQ5OTE3NzksImFiIjowfQ.png"

    .line 152
    .line 153
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IllaRVJINFFBNklQUTZIWldGNzJKNjVETzNGWFBFQSIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzExMDgzNjAzNzU1MTEzMjk3MSwiYWIiOjB9.png"

    .line 157
    .line 158
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjdFSjRUSTRHT1FPSjIzT0E1R0lZWlVNUklZRUdZMzAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoyNTc5MDk2NzA3MzQxNDY1MTMxLCJhYiI6MH0.png"

    .line 162
    .line 163
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjVDVFJVVzRGWElURUk3UEdGMjQ1SElBWldOWEhLUDAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzk3MTQ3MDc0NjQ0NTE0NjAzLCJhYiI6MH0.png"

    .line 167
    .line 168
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjNKTjREVUlWVlc1NlVWRlpQN1QzWU43QzJDRDRHUDAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTA4NTgwNjk3NjEyOTAzMjI3LCJhYiI6MH0.png"

    .line 172
    .line 173
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlQ3VjZNQkZRR1VTUkJPQ0RPTTRFWlVSVkZUMktCUzAyIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNzI1NTA5MTY0NDU0OTE3NDAzLCJhYiI6MH0.png"

    .line 177
    .line 178
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkNPRkFGUktLU0pRRVRJVkhRQUhXUTRGVDdMTVRRQSIsInciOjEwOCwiaCI6MTA4LCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6MzEwOTEyNTIxMzUyOTMxMDQ3NSwiYWIiOjB9.png"

    .line 182
    .line 183
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IjIzTjVaRUhCRjJLRlI2TjZITlBESVlNTjZRTkhJNzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxOTkyMTY3Mjk1NDMxODEzOTQ3LCJhYiI6MH0.png"

    .line 187
    .line 188
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IkpLS0hZN0xMUURZVFI1WEhIN05WRUJGWFFaSFM3RzAzIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozMTUzODEzOTIxMDQ1MzMzMDM1LCJhYiI6MH0.png"

    .line 192
    .line 193
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    const-string p0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlQ1UVc2SEZBTklIMzRGSFFHRUNRSzRMNjcyTklSVjAwIiwidyI6MTA4LCJoIjoxMDgsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjozNDM0Nzk3MDAyMjc4OTA0NTkxLCJhYiI6MH0.png"

    .line 197
    .line 198
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 199
    .line 200
    .line 201
    return-object v0
.end method
