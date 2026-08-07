.class public Ll/d2d0$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d2d0$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b16;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ll/d2d0$b;


# direct methods
.method public constructor <init>(Ll/d2d0$b;Ll/b16;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/d2d0$b$a;->c:Ll/d2d0$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/d2d0$b$a;->a:Ll/b16;

    .line 4
    .line 5
    iput-object p3, p0, Ll/d2d0$b$a;->b:Ljava/lang/Object;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d2d0$b$a;->a:Ll/b16;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d2d0$b$a;->b:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/b16;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
