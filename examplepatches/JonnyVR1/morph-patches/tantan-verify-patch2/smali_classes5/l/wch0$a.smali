.class public Ll/wch0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e6m;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wch0;->o0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wch0;


# direct methods
.method public constructor <init>(Ll/wch0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wch0$a;->a:Ll/wch0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public disableAutoPV()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wch0$a;->a:Ll/wch0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wch0;->l0(Ll/wch0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_feedback_end_popup"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "p_feedback_question_popup"

    .line 13
    .line 14
    return-object p0
.end method
