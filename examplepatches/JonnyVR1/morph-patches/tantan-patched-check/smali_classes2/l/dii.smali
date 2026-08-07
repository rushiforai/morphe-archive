.class public final synthetic Ll/dii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/facebook/internal/FetchedAppSettingsManager$a;

.field public final synthetic b:Lcom/facebook/internal/d;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/internal/FetchedAppSettingsManager$a;Lcom/facebook/internal/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dii;->a:Lcom/facebook/internal/FetchedAppSettingsManager$a;

    iput-object p2, p0, Ll/dii;->b:Lcom/facebook/internal/d;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dii;->a:Lcom/facebook/internal/FetchedAppSettingsManager$a;

    iget-object p0, p0, Ll/dii;->b:Lcom/facebook/internal/d;

    invoke-static {v0, p0}, Lcom/facebook/internal/FetchedAppSettingsManager;->c(Lcom/facebook/internal/FetchedAppSettingsManager$a;Lcom/facebook/internal/d;)V

    return-void
.end method
