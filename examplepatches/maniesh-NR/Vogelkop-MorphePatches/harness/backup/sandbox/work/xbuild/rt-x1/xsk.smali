.class public final enum Lxsk;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final c:Ldpj;

.field public static final d:Ljava/lang/String;

.field public static final e:Ljava/util/ArrayList;

.field public static final synthetic f:[Lxsk;

.field public static final synthetic g:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Lxsk;

    const-string v1, "VPN Pro"

    const-string v2, "vpn_pro_in_app_notification"

    const-string v3, "VPN_PRO"

    const/4 v7, 0x0

    invoke-direct {v0, v3, v7, v1, v2}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lxsk;

    const-string v2, "Wallpaper"

    const-string v3, "wallpaper_in_app_notification"

    const-string v4, "WALLPAPER"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lxsk;

    const-string v3, "Feedback and Ratings"

    const-string v4, "feedback_in_app_notification"

    const-string v5, "FEEDBACK_AND_RATINGS"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lxsk;

    const-string v4, "Product and service news"

    const-string v5, "product_and_service_in_app_notification"

    const-string v6, "PRODUCT_AND_SERVICE_NEWS"

    const/4 v8, 0x3

    invoke-direct {v3, v6, v8, v4, v5}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v4, Lxsk;

    const-string v5, "Feature tips"

    const-string v6, "feature_tips_notification"

    const-string v9, "FEATURE_TIPS"

    const/4 v10, 0x4

    invoke-direct {v4, v9, v10, v5, v6}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lxsk;

    const-string v6, "Rewards"

    const-string v9, "rewards_notifications"

    const-string v10, "REWARDS"

    const/4 v11, 0x5

    invoke-direct {v5, v10, v11, v6, v9}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    new-instance v6, Lxsk;

    const-string v9, "eSIM"

    const-string v10, "esim_notifications"

    const-string v11, "ESIM"

    const/4 v12, 0x6

    invoke-direct {v6, v11, v12, v9, v10}, Lxsk;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    filled-new-array/range {v0 .. v6}, [Lxsk;

    move-result-object v0

    sput-object v0, Lxsk;->f:[Lxsk;

    new-instance v9, Lh58;

    invoke-direct {v9, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v9, Lxsk;->g:Lh58;

    new-instance v0, Ldpj;

    invoke-direct {v0, v8}, Ldpj;-><init>(B)V

    sput-object v0, Lxsk;->c:Ldpj;

    new-instance v14, Lr4k;

    const/16 v0, 0x18

    invoke-direct {v14, v0}, Lr4k;-><init>(B)V

    const/16 v15, 0x1e

    const-string v10, ","

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v15}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lxsk;->d:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v9, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Lw4;

    invoke-direct {v1, v9, v7}, Lw4;-><init>(Ljava/lang/Object;B)V

    :goto_8c
    invoke-virtual {v1}, Lw4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9e

    invoke-virtual {v1}, Lw4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxsk;

    iget-object v2, v2, Lxsk;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8c

    :cond_9e
    sput-object v0, Lxsk;->e:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lxsk;->a:Ljava/lang/String;

    iput-object p4, p0, Lxsk;->b:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lxsk;
    .registers 2

    const-class v0, Lxsk;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lxsk;

    return-object p0
.end method

.method public static values()[Lxsk;
    .registers 1

    sget-object v0, Lxsk;->f:[Lxsk;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lxsk;

    return-object v0
.end method
