.class public final synthetic Ll/qy5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/ry5;


# direct methods
.method public synthetic constructor <init>(Ll/ry5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qy5;->a:Ll/ry5;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qy5;->a:Ll/ry5;

    invoke-static {p0, p1, p2}, Ll/ry5;->c(Ll/ry5;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
