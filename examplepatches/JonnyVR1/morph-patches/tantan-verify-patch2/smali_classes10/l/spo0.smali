.class public final synthetic Ll/spo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/vpo0;


# direct methods
.method public synthetic constructor <init>(Ll/vpo0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/spo0;->a:Ll/vpo0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/spo0;->a:Ll/vpo0;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1, p2}, Ll/vpo0;->R(Ljava/lang/Integer;Ljava/lang/Object;)V

    return-void
.end method
