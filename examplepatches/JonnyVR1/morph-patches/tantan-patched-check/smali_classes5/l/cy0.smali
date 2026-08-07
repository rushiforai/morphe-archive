.class public final synthetic Ll/cy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:[Ll/th0;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>([Ll/th0;ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cy0;->a:[Ll/th0;

    iput-boolean p2, p0, Ll/cy0;->b:Z

    iput-object p3, p0, Ll/cy0;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cy0;->a:[Ll/th0;

    iget-boolean v1, p0, Ll/cy0;->b:Z

    iget-object p0, p0, Ll/cy0;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/ey0;->b([Ll/th0;ZLcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
