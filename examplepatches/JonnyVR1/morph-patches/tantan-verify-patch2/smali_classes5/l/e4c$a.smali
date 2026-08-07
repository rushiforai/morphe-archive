.class public Ll/e4c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/e4c;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/e4c;


# direct methods
.method public constructor <init>(Ll/e4c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/e4c$a;->a:Ll/e4c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;->DAY:Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/android/ui/UIModeHelper;->g(Lcom/p1/mobile/android/ui/UIModeHelper$UIMode;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/e4c$a;->a:Ll/e4c;

    .line 7
    .line 8
    invoke-static {p0}, Ll/e4c;->i(Ll/e4c;)Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
