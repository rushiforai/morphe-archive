.class public final synthetic Ll/hwp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/jwp0;


# direct methods
.method public synthetic constructor <init>(Ll/jwp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hwp0;->a:Ll/jwp0;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hwp0;->a:Ll/jwp0;

    invoke-static {p0, p1, p2}, Ll/jwp0;->a(Ll/jwp0;Landroid/widget/RadioGroup;I)V

    return-void
.end method
