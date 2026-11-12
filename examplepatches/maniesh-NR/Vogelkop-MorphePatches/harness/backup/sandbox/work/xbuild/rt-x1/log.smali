.class public final Llog;
.super Le55;
.source "SourceFile"


# static fields
.field public static final h:Lir5;


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Levj;

.field public final d:Ljava/lang/String;

.field public final e:Lkog;

.field public final f:J

.field public final g:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lir5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Llog;->h:Lir5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Levj;Ljava/lang/String;Lkog;JLjava/util/ArrayList;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llog;->b:Ljava/lang/String;

    iput-object p2, p0, Llog;->c:Levj;

    iput-object p3, p0, Llog;->d:Ljava/lang/String;

    iput-object p4, p0, Llog;->e:Lkog;

    iput-wide p5, p0, Llog;->f:J

    invoke-static {p7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Llog;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_19

    const-class v0, Llog;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_19

    check-cast p1, Llog;

    iget-object p1, p1, Llog;->b:Ljava/lang/String;

    iget-object p0, p0, Llog;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Llog;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
