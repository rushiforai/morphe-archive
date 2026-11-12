.class public final Lngn;
.super Ld17;
.source "SourceFile"


# instance fields
.field public d:Z

.field public e:I

.field public final synthetic f:Lsgi;


# direct methods
.method public constructor <init>(Lsgi;)V
    .registers 4

    iput-object p1, p0, Lngn;->f:Lsgi;

    const-wide/16 v0, 0x64

    invoke-direct {p0, v0, v1}, Ld17;-><init>(J)V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-boolean v0, p0, Lngn;->d:Z

    iget v1, p0, Lngn;->e:I

    iget-object p0, p0, Lngn;->f:Lsgi;

    invoke-virtual {p0, v1, v0}, Lsgi;->J(IZ)V

    iget-object p0, p0, Lsgi;->e:Ljava/lang/Object;

    check-cast p0, Lrdn;

    invoke-virtual {p0}, Lrdn;->run()V

    return-void
.end method
