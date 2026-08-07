.class public final synthetic Ll/c2j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/i2j;


# direct methods
.method public synthetic constructor <init>(Ll/i2j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2j;->a:Ll/i2j;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c2j;->a:Ll/i2j;

    invoke-static {p0, p1, p2}, Ll/i2j;->e(Ll/i2j;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
