.class public final synthetic Ll/ipg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a30;


# instance fields
.field public final synthetic a:Ll/lpg;


# direct methods
.method public synthetic constructor <init>(Ll/lpg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ipg;->a:Ll/lpg;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ipg;->a:Ll/lpg;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-virtual {p0, p1, p2, p3}, Ll/lpg;->N(Ljava/lang/Object;II)Z

    return-void
.end method
