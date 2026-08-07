.class public final synthetic Ll/n20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/widget/ArrayAdapter;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ArrayAdapter;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n20;->a:Landroid/widget/ArrayAdapter;

    iput p2, p0, Ll/n20;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n20;->a:Landroid/widget/ArrayAdapter;

    iget p0, p0, Ll/n20;->b:I

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/android/app/Act$m;->a(Landroid/widget/ArrayAdapter;ILl/pf60;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
