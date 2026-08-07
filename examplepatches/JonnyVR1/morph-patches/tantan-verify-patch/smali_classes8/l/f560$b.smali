.class public Ll/f560$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f560;->a(Ll/gcg0;)Ll/gcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/f560;


# direct methods
.method public constructor <init>(Ll/f560;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f560$b;->b:Ll/f560;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f560$b;->a:Ll/gcg0;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f560$b;->b:Ll/f560;

    .line 2
    .line 3
    iget-object v0, v0, Ll/f560;->a:Ll/f2e0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/f2e0;->createWorker()Ll/f2e0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/f560$b$a;

    .line 10
    .line 11
    invoke-direct {v1, p0, v0}, Ll/f560$b$a;-><init>(Ll/f560$b;Ll/f2e0$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method
