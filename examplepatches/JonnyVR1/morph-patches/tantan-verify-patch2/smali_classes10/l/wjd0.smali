.class public final synthetic Ll/wjd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wkd0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/wkd0;Ljava/lang/String;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wjd0;->a:Ll/wkd0;

    iput-object p2, p0, Ll/wjd0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wjd0;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wjd0;->a:Ll/wkd0;

    iget-object v1, p0, Ll/wjd0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wjd0;->c:Landroid/widget/TextView;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/wkd0;->W3(Ll/wkd0;Ljava/lang/String;Landroid/widget/TextView;Ljava/lang/Long;)V

    return-void
.end method
