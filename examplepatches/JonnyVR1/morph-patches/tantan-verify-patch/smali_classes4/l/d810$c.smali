.class public Ll/d810$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d810;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Ljava/lang/Runnable;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d810$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/d810$c;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/d810$c;->c:Z

    .line 6
    .line 7
    iput-object p4, p0, Ll/d810$c;->d:Ljava/lang/Runnable;

    .line 8
    .line 9
    iput-object p5, p0, Ll/d810$c;->e:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput-object p6, p0, Ll/d810$c;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/d810$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v1, p0, Ll/d810$c;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v3, p0, Ll/d810$c;->b:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v4, p0, Ll/d810$c;->c:Z

    .line 15
    .line 16
    iget-object v5, p0, Ll/d810$c;->d:Ljava/lang/Runnable;

    .line 17
    .line 18
    iget-object v6, p0, Ll/d810$c;->e:Ljava/lang/Runnable;

    .line 19
    .line 20
    iget-object v7, p0, Ll/d810$c;->f:Ljava/lang/String;

    .line 21
    .line 22
    move-object v2, p1

    .line 23
    invoke-static/range {v1 .. v7}, Ll/d810;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d810$c;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
