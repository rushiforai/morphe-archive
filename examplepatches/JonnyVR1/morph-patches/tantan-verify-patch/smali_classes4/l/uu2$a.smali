.class public Ll/uu2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uu2;->g(Ljava/lang/Throwable;Ljava/lang/String;Ll/ili;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Throwable;

.field public final synthetic b:Ljava/lang/Thread;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uu2$a;->a:Ljava/lang/Throwable;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uu2$a;->b:Ljava/lang/Thread;

    .line 4
    .line 5
    iput-object p3, p0, Ll/uu2$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uu2$a;->a:Ljava/lang/Throwable;

    .line 2
    .line 3
    iget-object v1, p0, Ll/uu2$a;->b:Ljava/lang/Thread;

    .line 4
    .line 5
    iget-object p0, p0, Ll/uu2$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/uu2;->a(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
