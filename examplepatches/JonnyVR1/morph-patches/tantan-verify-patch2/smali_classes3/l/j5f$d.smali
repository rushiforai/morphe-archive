.class public Ll/j5f$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j5f;->b(Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/j5f$e;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j5f$d;->a:Ll/y20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/j5f$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j5f$d;->a:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j5f$e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j5f$d;->a(Ll/j5f$e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
