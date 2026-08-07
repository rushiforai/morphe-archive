.class public final synthetic Ll/az40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:[Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/l4g0;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/az40;->a:[Ljava/lang/String;

    iput-object p2, p0, Ll/az40;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/az40;->c:Ll/l4g0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/az40;->a:[Ljava/lang/String;

    iget-object v1, p0, Ll/az40;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/az40;->c:Ll/l4g0;

    invoke-static {v0, v1, p0, p1}, Ll/iz40;->b([Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/l4g0;Landroid/view/View;)V

    return-void
.end method
