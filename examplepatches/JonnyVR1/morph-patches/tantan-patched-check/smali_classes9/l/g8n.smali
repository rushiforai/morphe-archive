.class public final synthetic Ll/g8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/o8n;


# direct methods
.method public synthetic constructor <init>(Ll/o8n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g8n;->a:Ll/o8n;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g8n;->a:Ll/o8n;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/o8n;->b(Ll/o8n;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
