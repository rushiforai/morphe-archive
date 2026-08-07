.class public Ll/jze$a;
.super Ll/iye$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jze;->c(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ll/jze;


# direct methods
.method public constructor <init>(Ll/jze;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jze$a;->b:Ll/jze;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jze$a;->a:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/iye$d;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jze$a;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jze$a;->b:Ll/jze;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/jze;->d(Ll/jze;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jze$a;->a:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
