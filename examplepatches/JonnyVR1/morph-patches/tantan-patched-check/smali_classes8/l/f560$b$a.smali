.class public Ll/f560$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f560$b;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/f2e0$a;

.field public final synthetic b:Ll/f560$b;


# direct methods
.method public constructor <init>(Ll/f560$b;Ll/f2e0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f560$b$a;->b:Ll/f560$b;

    .line 2
    .line 3
    iput-object p2, p0, Ll/f560$b$a;->a:Ll/f2e0$a;

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
    iget-object v0, p0, Ll/f560$b$a;->b:Ll/f560$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/f560$b;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gcg0;->unsubscribe()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/f560$b$a;->a:Ll/f2e0$a;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
