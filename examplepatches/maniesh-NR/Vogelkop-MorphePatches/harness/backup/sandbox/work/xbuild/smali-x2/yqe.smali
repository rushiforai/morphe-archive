.class public final Lyqe;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lyqe;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lyqe;

    const-string v1, ""

    const/4 v2, 0x1

    const-string v3, "topnews"

    invoke-direct {v0, v3, v1, v2}, Lyqe;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    sput-object v0, Lyqe;->d:Lyqe;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyqe;->a:Ljava/lang/String;

    iput-object p2, p0, Lyqe;->b:Ljava/lang/String;

    iput-boolean p3, p0, Lyqe;->c:Z

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 2

    iget-object p0, p0, Lyqe;->a:Ljava/lang/String;

    const-string v0, "cur_city_id"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lyqe;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    check-cast p1, Lyqe;

    iget-object p0, p0, Lyqe;->a:Ljava/lang/String;

    iget-object p1, p1, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
