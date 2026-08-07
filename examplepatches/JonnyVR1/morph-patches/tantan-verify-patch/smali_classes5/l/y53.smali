.class public final synthetic Ll/y53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y53;->a:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    iput-object p2, p0, Ll/y53;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/y53;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/y53;->d:Ll/z20;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/y53;->a:Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    iget-object v1, p0, Ll/y53;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/y53;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/y53;->d:Ll/z20;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->e(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
