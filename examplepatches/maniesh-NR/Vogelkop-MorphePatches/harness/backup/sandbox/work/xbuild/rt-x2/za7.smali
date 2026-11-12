.class public final Lza7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lab7;


# static fields
.field public static final a:Lza7;

.field public static final b:Lcv6;

.field public static final c:Lmr6;

.field public static final d:Lmr6;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lza7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lza7;->a:Lza7;

    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Ls6d;->a:Ld7a;

    sget-object v0, Lbb7;->a:Lcv6;

    sput-object v0, Lza7;->b:Lcv6;

    sget-object v1, Lmr6;->b:Lmr6;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lmr6;->K(ILjava/lang/String;)Ldx5;

    sput-object v1, Lza7;->c:Lmr6;

    sput-object v1, Lza7;->d:Lmr6;

    invoke-virtual {v0, v2, v3}, Lcv6;->K(ILjava/lang/String;)Ldx5;

    return-void
.end method


# virtual methods
.method public final a()Ldx5;
    .registers 1

    sget-object p0, Lza7;->b:Lcv6;

    return-object p0
.end method

.method public final b()Ldx5;
    .registers 1

    sget-object p0, Lza7;->c:Lmr6;

    return-object p0
.end method

.method public final c()Ldx5;
    .registers 1

    sget-object p0, Lza7;->d:Lmr6;

    return-object p0
.end method
