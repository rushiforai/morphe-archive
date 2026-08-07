.class public Ll/j560$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j560$b;-><init>(Ll/j560;Ll/gcg0;Ll/f2e0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/j560;

.field public final synthetic b:Ll/j560$b;


# direct methods
.method public constructor <init>(Ll/j560$b;Ll/j560;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j560$b$a;->b:Ll/j560$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/j560$b$a;->a:Ll/j560;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j560$b$a;->b:Ll/j560$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/j560$b;->j:Ll/j560$d;

    .line 4
    .line 5
    iget-object v0, v0, Ll/j560$d;->a:Ll/bb50;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/j560$b$a;->b:Ll/j560$b;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
