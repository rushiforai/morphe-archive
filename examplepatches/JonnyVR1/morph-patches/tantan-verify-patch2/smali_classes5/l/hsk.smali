.class public final synthetic Ll/hsk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Landroid/widget/TextView;

.field public final synthetic d:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/hsk;->a:Z

    iput-object p2, p0, Ll/hsk;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/hsk;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ll/hsk;->d:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/hsk;->a:Z

    iget-object v1, p0, Ll/hsk;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/hsk;->c:Landroid/widget/TextView;

    iget-object p0, p0, Ll/hsk;->d:Landroid/widget/LinearLayout;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qtk;->O(ZLcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/Throwable;)V

    return-void
.end method
