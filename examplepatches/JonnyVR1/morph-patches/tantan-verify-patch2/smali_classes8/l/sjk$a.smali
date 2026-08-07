.class public Ll/sjk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sjk;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/z20<",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/sjk;


# direct methods
.method public constructor <init>(Ll/sjk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk$a;->a:Ll/sjk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sjk$a;->a:Ll/sjk;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Ll/sjk;->a0(Ll/sjk;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    check-cast p2, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/sjk$a;->a(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
