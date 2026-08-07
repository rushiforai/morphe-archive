.class public final synthetic Ll/bjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# instance fields
.field public final synthetic a:Ll/cjg;


# direct methods
.method public synthetic constructor <init>(Ll/cjg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bjg;->a:Ll/cjg;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjg;->a:Ll/cjg;

    invoke-static {p0, p1, p2}, Ll/cjg;->b(Ll/cjg;Landroid/widget/RadioGroup;I)V

    return-void
.end method
