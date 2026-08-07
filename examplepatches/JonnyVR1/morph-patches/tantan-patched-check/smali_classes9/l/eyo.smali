.class public final synthetic Ll/eyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Ll/x20;

.field public final synthetic g:Ll/x20;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Z

.field public final synthetic j:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Ljava/lang/String;ILl/x20;Ll/x20;Ljava/lang/String;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eyo;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/eyo;->b:Ljava/util/List;

    iput-object p3, p0, Ll/eyo;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/eyo;->d:Ljava/lang/String;

    iput p5, p0, Ll/eyo;->e:I

    iput-object p6, p0, Ll/eyo;->f:Ll/x20;

    iput-object p7, p0, Ll/eyo;->g:Ll/x20;

    iput-object p8, p0, Ll/eyo;->h:Ljava/lang/String;

    iput-boolean p9, p0, Ll/eyo;->i:Z

    iput-object p10, p0, Ll/eyo;->j:Ll/y20;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/eyo;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/eyo;->b:Ljava/util/List;

    iget-object v2, p0, Ll/eyo;->c:Ljava/util/ArrayList;

    iget-object v3, p0, Ll/eyo;->d:Ljava/lang/String;

    iget v4, p0, Ll/eyo;->e:I

    iget-object v5, p0, Ll/eyo;->f:Ll/x20;

    iget-object v6, p0, Ll/eyo;->g:Ll/x20;

    iget-object v7, p0, Ll/eyo;->h:Ljava/lang/String;

    iget-boolean v8, p0, Ll/eyo;->i:Z

    iget-object v9, p0, Ll/eyo;->j:Ll/y20;

    invoke-static/range {v0 .. v9}, Ll/kyo;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/util/ArrayList;Ljava/lang/String;ILl/x20;Ll/x20;Ljava/lang/String;ZLl/y20;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
