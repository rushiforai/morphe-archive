.class public final synthetic Ll/ip8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:[Ll/w30;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;[Ll/w30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ip8;->a:Ljava/util/List;

    iput-object p2, p0, Ll/ip8;->b:[Ll/w30;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ip8;->a:Ljava/util/List;

    iget-object p0, p0, Ll/ip8;->b:[Ll/w30;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->j(Ljava/util/List;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
