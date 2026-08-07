.class public final synthetic Ll/ucm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/edm;


# direct methods
.method public synthetic constructor <init>(Ll/edm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ucm;->a:Ll/edm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ucm;->a:Ll/edm;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ll/nwb0;

    invoke-static {p0, p1, p2}, Ll/edm;->b(Ll/edm;Ljava/lang/Integer;Ll/nwb0;)V

    return-void
.end method
