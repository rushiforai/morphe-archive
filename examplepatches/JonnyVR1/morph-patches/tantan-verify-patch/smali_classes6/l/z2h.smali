.class public final synthetic Ll/z2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z2h;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/z2h;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/z2h;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/z2h;->a:Ljava/util/ArrayList;

    iget-object v1, p0, Ll/z2h;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/z2h;->c:Ll/y20;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Ll/k3h;->O(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;Ll/y20;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
