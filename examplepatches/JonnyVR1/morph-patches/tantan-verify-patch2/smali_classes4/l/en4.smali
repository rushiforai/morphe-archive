.class public Ll/en4;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()V
    .locals 3

    .line 1
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "expanded_card_svga_config"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 32
    .line 33
    sput-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 36
    sput-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 37
    .line 38
    :cond_1
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 39
    .line 40
    if-nez v0, :cond_3

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->new_()Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 47
    .line 48
    invoke-static {}, Ll/gra;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 55
    .line 56
    const-string v1, "https://auto.tancdn.com/v1/raw/af9a963e-6627-4d56-b884-66aba6f83b7214.svga"

    .line 57
    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_like:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "https://auto.tancdn.com/v1/raw/e9b73488-6b63-430b-a6e4-4c45d14d39ba14.svga"

    .line 61
    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_dislike:Ljava/lang/String;

    .line 63
    .line 64
    const-string v1, "https://auto.tancdn.com/v1/raw/c1aa89e4-a595-4627-893f-6099b8d296c114.svga"

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_like:Ljava/lang/String;

    .line 67
    .line 68
    const-string v2, "https://auto.tancdn.com/v1/raw/eeb7b22a-053a-4abb-a0d8-fa599bc2d09e14.svga"

    .line 69
    .line 70
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_dislike:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_like:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_dislike:Ljava/lang/String;

    .line 75
    .line 76
    const-string v1, "https://auto.tancdn.com/v1/raw/07c25711-48f6-4ab0-8099-533c0534921b14.svga"

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_superlike:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 82
    .line 83
    const-string v1, "https://auto.tancdn.com/v1/raw/1ebe3c00-b777-4c2f-a915-a9da2727835e14.svga"

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_like:Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, "https://auto.tancdn.com/v1/raw/a2fe522c-fa3b-4d53-b3dd-cf87daf2c74014.svga"

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_dislike:Ljava/lang/String;

    .line 90
    .line 91
    const-string v1, "https://auto.tancdn.com/v1/raw/e5b42292-42ac-4538-beae-d36298e9a6b014.svga"

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_like:Ljava/lang/String;

    .line 94
    .line 95
    const-string v1, "https://auto.tancdn.com/v1/raw/1fa8c2f5-a5df-4f90-a812-54b56f71beed14.svga"

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_dislike:Ljava/lang/String;

    .line 98
    .line 99
    const-string v1, "https://auto.tancdn.com/v1/raw/e2901675-83fd-4bf2-9442-2ed962337a7e14.svga"

    .line 100
    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_like:Ljava/lang/String;

    .line 102
    .line 103
    const-string v1, "https://auto.tancdn.com/v1/raw/99bc71ba-ef57-4b04-a05a-fd34a1175aa814.svga"

    .line 104
    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_dislike:Ljava/lang/String;

    .line 106
    .line 107
    const-string v1, "https://fe-static.tancdn.com/v1/raw/02f81d7a-799d-4e83-a6b5-9e036be1310914.svga"

    .line 108
    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_superlike:Ljava/lang/String;

    .line 110
    .line 111
    :cond_3
    :goto_0
    return-void
.end method

.method public static b()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_dislike:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_like:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static d()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_click_superlike:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_dislike:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static f()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_btn_like:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_dislike:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static h()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/en4;->a()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;->card_like:Ljava/lang/String;

    .line 7
    .line 8
    return-object v0
.end method

.method public static i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput-object v0, Ll/en4;->a:Lcom/p1/mobile/putong/core/data/ExpandedSwipeSvgaConfig;

    .line 3
    .line 4
    return-void
.end method
