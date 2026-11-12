.class public final Lven;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:Lltg;


# instance fields
.field public final a:Lwv1;

.field public final b:Lwv1;

.field public final c:Lji;

.field public final d:Lji;

.field public final e:Lnu3;

.field public final f:Lorm;

.field public final g:Lru9;

.field public final h:Lnej;

.field public i:Lxq3;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lltg;

    const-string v1, "local"

    const/4 v2, 0x0

    const-string v3, "web_page_promo"

    invoke-direct {v0, v3, v1, v2}, Lltg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lven;->j:Lltg;

    return-void
.end method

.method public constructor <init>(Ltcc;Lk6l;Lwv1;Lwv1;Lji;Lji;Lnu3;Lorm;Lru9;Lnej;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lven;->a:Lwv1;

    iput-object p4, p0, Lven;->b:Lwv1;

    iput-object p5, p0, Lven;->c:Lji;

    iput-object p6, p0, Lven;->d:Lji;

    iput-object p7, p0, Lven;->e:Lnu3;

    iput-object p8, p0, Lven;->f:Lorm;

    iput-object p9, p0, Lven;->g:Lru9;

    iput-object p10, p0, Lven;->h:Lnej;

    new-instance p3, Lwjh;

    new-instance p4, Luen;

    const/4 p5, 0x0

    invoke-direct {p4, p0, p5}, Luen;-><init>(Lven;B)V

    new-instance p5, Luen;

    const/4 p6, 0x1

    invoke-direct {p5, p0, p6}, Luen;-><init>(Lven;B)V

    invoke-direct {p3, p1, p2, p4, p5}, Lwjh;-><init>(Ltcc;Lk6l;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
