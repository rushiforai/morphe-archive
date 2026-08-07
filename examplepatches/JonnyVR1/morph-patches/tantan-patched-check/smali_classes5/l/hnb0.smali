.class public final synthetic Ll/hnb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/rnb0;


# direct methods
.method public synthetic constructor <init>(Ll/rnb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hnb0;->a:Ll/rnb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hnb0;->a:Ll/rnb0;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/rnb0;->w(Ll/rnb0;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method
