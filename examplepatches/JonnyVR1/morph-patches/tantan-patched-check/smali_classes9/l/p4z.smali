.class public final synthetic Ll/p4z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/n4z;


# direct methods
.method public synthetic constructor <init>(Ll/n4z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p4z;->a:Ll/n4z;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4z;->a:Ll/n4z;

    check-cast p1, Lv/VDraweeView;

    invoke-virtual {p0, p1}, Ll/n4z;->A0(Lv/VDraweeView;)V

    return-void
.end method
