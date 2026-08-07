.class public Ll/u1z$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e6m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u1z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u1z;


# direct methods
.method public constructor <init>(Ll/u1z;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1z$d;->a:Ll/u1z;

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
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chat_view_sensitiveword_block_popup_show"

    .line 2
    .line 3
    return-object p0
.end method
