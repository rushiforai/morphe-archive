.class public final synthetic Ll/b14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/m14;


# direct methods
.method public synthetic constructor <init>(Ll/m14;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b14;->a:Ll/m14;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b14;->a:Ll/m14;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/m14;->X3(Ll/m14;Ljava/lang/Integer;Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
