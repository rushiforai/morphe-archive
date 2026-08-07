.class public final synthetic Ll/sy90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/az90;


# direct methods
.method public synthetic constructor <init>(Ll/az90;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sy90;->a:Ll/az90;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sy90;->a:Ll/az90;

    check-cast p1, Lv/VText_Tags;

    invoke-static {p0, p1}, Ll/az90;->W(Ll/az90;Lv/VText_Tags;)V

    return-void
.end method
