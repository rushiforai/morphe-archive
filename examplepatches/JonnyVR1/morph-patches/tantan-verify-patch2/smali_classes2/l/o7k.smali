.class public final synthetic Ll/o7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/facebook/appevents/AppEvent;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/facebook/appevents/AppEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7k;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/o7k;->b:Lcom/facebook/appevents/AppEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o7k;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/o7k;->b:Lcom/facebook/appevents/AppEvent;

    invoke-static {v0, p0}, Lcom/facebook/appevents/gps/ara/GpsAraTriggersManager;->a(Ljava/lang/String;Lcom/facebook/appevents/AppEvent;)V

    return-void
.end method
