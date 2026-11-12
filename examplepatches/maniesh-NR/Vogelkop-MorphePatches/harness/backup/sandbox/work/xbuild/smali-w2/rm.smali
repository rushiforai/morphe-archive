.class public final enum Lrm;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final enum b:Lrm;

.field public static final enum c:Lrm;

.field public static final enum d:Lrm;

.field public static final enum e:Lrm;

.field public static final enum f:Lrm;

.field public static final enum g:Lrm;

.field public static final h:Lrm;

.field public static final i:Ljava/util/Set;

.field public static final synthetic j:[Lrm;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lrm;

    const/4 v1, 0x0

    const-string v2, "native"

    const-string v3, "NATIVE"

    invoke-direct {v0, v3, v1, v2}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lrm;->b:Lrm;

    new-instance v1, Lrm;

    const/4 v2, 0x1

    const-string v3, "banner/small"

    const-string v4, "BANNER_SMALL"

    invoke-direct {v1, v4, v2, v3}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lrm;->c:Lrm;

    new-instance v2, Lrm;

    const/4 v3, 0x2

    const-string v4, "banner/medium"

    const-string v5, "BANNER_MEDIUM"

    invoke-direct {v2, v5, v3, v4}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    new-instance v3, Lrm;

    const/4 v4, 0x3

    const-string v5, "banner/inline"

    const-string v6, "BANNER_INLINE"

    invoke-direct {v3, v6, v4, v5}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lrm;->d:Lrm;

    new-instance v4, Lrm;

    const/4 v5, 0x4

    const-string v6, "banner/inline_medium"

    const-string v7, "BANNER_INLINE_MEDIUM"

    invoke-direct {v4, v7, v5, v6}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v4, Lrm;->e:Lrm;

    new-instance v5, Lrm;

    const/4 v6, 0x5

    const-string v7, "interstitial"

    const-string v8, "INTERSTITIAL"

    invoke-direct {v5, v8, v6, v7}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lrm;->f:Lrm;

    new-instance v6, Lrm;

    const/4 v7, 0x6

    const-string v8, "icon"

    const-string v9, "ICON"

    invoke-direct {v6, v9, v7, v8}, Lrm;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v6, Lrm;->g:Lrm;

    filled-new-array/range {v0 .. v6}, [Lrm;

    move-result-object v1

    sput-object v1, Lrm;->j:[Lrm;

    sput-object v0, Lrm;->h:Lrm;

    const-class v0, Lrm;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lrm;->i:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lrm;->a:Ljava/lang/String;

    return-void
.end method

.method public static d(Ljava/lang/String;)Lrm;
    .registers 6

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Lrm;->h:Lrm;

    return-object p0

    :cond_9
    invoke-static {}, Lrm;->values()[Lrm;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v1, :cond_1f

    aget-object v3, v0, v2

    iget-object v4, v3, Lrm;->a:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    return-object v3

    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_1f
    const-string v0, "unknown ad format: "

    invoke-static {v0, p0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lrm;
    .registers 2

    const-class v0, Lrm;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lrm;

    return-object p0
.end method

.method public static values()[Lrm;
    .registers 1

    sget-object v0, Lrm;->j:[Lrm;

    invoke-virtual {v0}, [Lrm;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lrm;

    return-object v0
.end method
