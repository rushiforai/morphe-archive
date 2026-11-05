.class Le/e/a/PopupAspect214$2;
.super Ljava/lang/Object;
.source "PopupAspect214.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/PopupAspect214;->changed(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$owner:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 8
    iput-object p1, p0, Le/e/a/PopupAspect214$2;->val$owner:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .line 8
    iget-object v0, p0, Le/e/a/PopupAspect214$2;->val$owner:Ljava/lang/Object;

    invoke-static {v0}, Le/e/a/PopupAspect214;->sync(Ljava/lang/Object;)V

    return-void
.end method
