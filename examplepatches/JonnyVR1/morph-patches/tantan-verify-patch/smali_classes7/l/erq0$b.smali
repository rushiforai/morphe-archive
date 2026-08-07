.class Ll/erq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/erq0;->k(Ll/gr60;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/gr60;

.field final synthetic b:Ll/erq0;


# direct methods
.method public constructor <init>(Ll/erq0;Ll/gr60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/erq0$b;->b:Ll/erq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/erq0$b;->a:Ll/gr60;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/erq0$b;->b:Ll/erq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/erq0$b;->a:Ll/gr60;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/erq0;->n(Ll/erq0;Ll/gr60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
