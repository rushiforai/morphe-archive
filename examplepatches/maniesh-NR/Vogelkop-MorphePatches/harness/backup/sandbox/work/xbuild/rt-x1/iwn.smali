.class public final Liwn;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ltmj;

.field public static final e:Ljf2;


# instance fields
.field public final a:Lo28;

.field public final b:Lwub;

.field public final c:Lovn;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ltmj;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ltmj;-><init>(B)V

    sput-object v0, Liwn;->d:Ltmj;

    const-class v0, Liwn;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    :try_start_f
    invoke-static {v0}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v0
    :try_end_13
    .catchall {:try_start_f .. :try_end_13} :catchall_14

    goto :goto_15

    :catchall_14
    const/4 v0, 0x0

    :goto_15
    new-instance v2, Lx9m;

    invoke-direct {v2, v1, v0}, Lx9m;-><init>(Litb;Lcam;)V

    new-instance v0, Ljf2;

    const-string v1, "Websocket"

    invoke-direct {v0, v1, v2}, Ljf2;-><init>(Ljava/lang/String;Lx9m;)V

    sput-object v0, Liwn;->e:Ljf2;

    return-void
.end method

.method public constructor <init>(Lo28;Lwub;Lovn;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liwn;->a:Lo28;

    iput-object p2, p0, Liwn;->b:Lwub;

    iput-object p3, p0, Liwn;->c:Lovn;

    return-void
.end method
