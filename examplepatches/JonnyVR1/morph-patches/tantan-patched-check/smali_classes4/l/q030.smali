.class public final synthetic Ll/q030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q030;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/q030;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q030;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/q030;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/r130;->b(Ljava/util/ArrayList;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
