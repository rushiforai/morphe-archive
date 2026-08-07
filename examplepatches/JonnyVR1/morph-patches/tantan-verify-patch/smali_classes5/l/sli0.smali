.class public final synthetic Ll/sli0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/vli0;


# direct methods
.method public synthetic constructor <init>(Ll/vli0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sli0;->a:Ll/vli0;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sli0;->a:Ll/vli0;

    invoke-static {p0, p1, p2}, Ll/vli0;->b(Ll/vli0;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
