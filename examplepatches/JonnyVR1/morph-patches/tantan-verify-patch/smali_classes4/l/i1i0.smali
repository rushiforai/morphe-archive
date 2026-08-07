.class public final synthetic Ll/i1i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i1i0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/i1i0;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/i1i0;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/i1i0;->d:Ljava/util/ArrayList;

    iput-object p5, p0, Ll/i1i0;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/i1i0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/i1i0;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Ll/i1i0;->c:Ljava/util/ArrayList;

    iget-object v3, p0, Ll/i1i0;->d:Ljava/util/ArrayList;

    iget-object v4, p0, Ll/i1i0;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/TagChooseMkAct;->p2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
