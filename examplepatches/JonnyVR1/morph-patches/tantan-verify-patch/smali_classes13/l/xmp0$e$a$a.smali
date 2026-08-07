.class Ll/xmp0$e$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xmp0$e$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0$e$a;


# direct methods
.method public constructor <init>(Ll/xmp0$e$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 2
    .line 3
    iget-object p1, p1, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 4
    .line 5
    iget-object p1, p1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/xmp0;->R3(Ll/xmp0;)Ll/evx;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v0, "uid:"

    .line 14
    .line 15
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 19
    .line 20
    iget-wide v0, p0, Ll/xmp0$e$a;->a:J

    .line 21
    .line 22
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "w:"

    .line 26
    .line 27
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, ",h:"

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p2, "surfaceChanged"

    .line 46
    .line 47
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 2
    .line 3
    iget-object p1, p1, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 4
    .line 5
    iget-object p1, p1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/xmp0;->Q3(Ll/xmp0;)Ll/evx;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "uid:"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 19
    .line 20
    iget-wide v1, p0, Ll/xmp0$e$a;->a:J

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "surfaceCreated"

    .line 30
    .line 31
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 2
    .line 3
    iget-object p1, p1, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 4
    .line 5
    iget-object p1, p1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 6
    .line 7
    invoke-static {p1}, Ll/xmp0;->T3(Ll/xmp0;)Ll/evx;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "uid:"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/xmp0$e$a$a;->a:Ll/xmp0$e$a;

    .line 19
    .line 20
    iget-wide v1, p0, Ll/xmp0$e$a;->a:J

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "surfaceDestroyed"

    .line 30
    .line 31
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
