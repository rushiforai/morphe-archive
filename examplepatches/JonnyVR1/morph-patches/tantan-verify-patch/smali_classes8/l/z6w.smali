.class public final synthetic Ll/z6w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w30$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lkotlin/jvm/functions/Function0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lkotlin/jvm/internal/Ref$ObjectRef;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Ljava/lang/String;Lkotlin/jvm/internal/Ref$ObjectRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z6w;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/z6w;->b:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Ll/z6w;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/z6w;->d:Lkotlin/jvm/internal/Ref$ObjectRef;

    return-void
.end method


# virtual methods
.method public final a(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/z6w;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/z6w;->b:Lkotlin/jvm/functions/Function0;

    iget-object v2, p0, Ll/z6w;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/z6w;->d:Lkotlin/jvm/internal/Ref$ObjectRef;

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    invoke-static/range {v0 .. v6}, Ll/d8w;->s(Lcom/p1/mobile/android/app/Act;Lkotlin/jvm/functions/Function0;Ljava/lang/String;Lkotlin/jvm/internal/Ref$ObjectRef;Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method
