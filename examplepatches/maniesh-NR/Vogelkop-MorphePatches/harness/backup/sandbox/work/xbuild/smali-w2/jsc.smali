.class public final Ljsc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lixh;

.field public static final d:Ljsc;

.field public static final e:Ljsc;

.field public static final f:Ljsc;


# instance fields
.field public final a:Lshf;

.field public final b:Lshf;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lixh;

    const/high16 v1, 0x42700000    # 60.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Ljsc;->c:Lixh;

    new-instance v0, Lshf;

    sget-object v1, Ldol;->d:Ldol;

    sget-object v2, Ldol;->e:Ldol;

    filled-new-array {v1, v2}, [Ldol;

    move-result-object v3

    sget-object v4, Ldol;->b:Ldol;

    sget-object v5, Ldol;->a:Ldol;

    filled-new-array {v1, v4, v5}, [Ldol;

    move-result-object v6

    filled-new-array {v1, v4, v5}, [Ldol;

    move-result-object v7

    invoke-direct {v0, v3, v6, v7}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v3, Lshf;

    filled-new-array {v2}, [Ldol;

    move-result-object v6

    filled-new-array {v4, v5}, [Ldol;

    move-result-object v7

    filled-new-array {v4, v5}, [Ldol;

    move-result-object v8

    invoke-direct {v3, v6, v7, v8}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Lshf;

    filled-new-array {v1, v2}, [Ldol;

    move-result-object v2

    filled-new-array {v1, v4, v5}, [Ldol;

    move-result-object v7

    sget-object v8, Ldol;->c:Ldol;

    filled-new-array {v8, v1, v4, v5}, [Ldol;

    move-result-object v1

    invoke-direct {v6, v2, v7, v1}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Ljsc;

    new-instance v2, Lshf;

    const/4 v4, 0x0

    new-array v7, v4, [Ldol;

    filled-new-array {v5}, [Ldol;

    move-result-object v8

    filled-new-array {v5}, [Ldol;

    move-result-object v9

    invoke-direct {v2, v7, v8, v9}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v7, Lshf;

    new-array v4, v4, [Ldol;

    filled-new-array {v5}, [Ldol;

    move-result-object v8

    filled-new-array {v5}, [Ldol;

    move-result-object v5

    invoke-direct {v7, v4, v8, v5}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v1, v2, v7}, Ljsc;-><init>(Lshf;Lshf;)V

    sput-object v1, Ljsc;->d:Ljsc;

    new-instance v1, Ljsc;

    invoke-direct {v1, v3, v6}, Ljsc;-><init>(Lshf;Lshf;)V

    sput-object v1, Ljsc;->e:Ljsc;

    new-instance v1, Ljsc;

    invoke-direct {v1, v3, v0}, Ljsc;-><init>(Lshf;Lshf;)V

    sput-object v1, Ljsc;->f:Ljsc;

    return-void
.end method

.method public constructor <init>(Lshf;Lshf;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljsc;->a:Lshf;

    iput-object p2, p0, Ljsc;->b:Lshf;

    return-void
.end method
