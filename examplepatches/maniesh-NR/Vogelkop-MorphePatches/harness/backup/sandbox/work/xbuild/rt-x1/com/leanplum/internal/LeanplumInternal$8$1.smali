.class Lcom/leanplum/internal/LeanplumInternal$8$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal$8;->onResponse(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/LeanplumInternal$8;

.field final synthetic val$success:Z


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/LeanplumInternal$8;Z)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iput-boolean p2, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->val$success:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    iget-boolean v0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->val$success:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object v0, v0, Lcom/leanplum/internal/LeanplumInternal$8;->val$location:Landroid/location/Location;

    const/4 v1, 0x0

    if-nez v0, :cond_14

    const-string p0, "Location can\'t be null in setUserLocationAttribute."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_14
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iget-object v3, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object v3, v3, Lcom/leanplum/internal/LeanplumInternal$8;->val$location:Landroid/location/Location;

    invoke-virtual {v3}, Landroid/location/Location;->getLongitude()D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    filled-new-array {v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    const-string v3, "%.6f,%.6f"

    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "location"

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object v0, v0, Lcom/leanplum/internal/LeanplumInternal$8;->val$locationAccuracyType:Lcom/leanplum/LeanplumLocationAccuracyType;

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v4, "locationAccuracyType"

    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_c8

    if-eqz v2, :cond_c8

    new-instance v4, Landroid/location/Geocoder;

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v4, v0, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    :try_start_60
    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object v0, v0, Lcom/leanplum/internal/LeanplumInternal$8;->val$location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v5

    iget-object v0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object v0, v0, Lcom/leanplum/internal/LeanplumInternal$8;->val$location:Landroid/location/Location;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v7

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_c8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_c8

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/Address;

    const-string v2, "city"

    invoke-virtual {v0}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "region"

    invoke-virtual {v0}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "country"

    invoke-virtual {v0}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_9e} :catch_b4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_60 .. :try_end_9e} :catch_9f
    .catchall {:try_start_60 .. :try_end_9e} :catchall_c8

    goto :goto_c8

    :catch_9f
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Invalid latitude or longitude values: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_c8

    :catch_b4
    move-exception v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "Failed to connect to Geocoder: "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :catchall_c8
    :cond_c8
    :goto_c8
    invoke-static {}, Lcom/leanplum/internal/RequestBuilder;->withSetUserAttributesAction()Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/leanplum/internal/RequestBuilder;->andParams(Ljava/util/Map;)Lcom/leanplum/internal/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/leanplum/internal/RequestBuilder;->create()Lcom/leanplum/internal/Request;

    move-result-object v0

    new-instance v1, Lcom/leanplum/internal/LeanplumInternal$8$1$1;

    invoke-direct {v1, p0}, Lcom/leanplum/internal/LeanplumInternal$8$1$1;-><init>(Lcom/leanplum/internal/LeanplumInternal$8$1;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onResponse(Lcom/leanplum/internal/Request$ResponseCallback;)V

    new-instance v1, Lcom/leanplum/internal/LeanplumInternal$8$1$2;

    invoke-direct {v1, p0}, Lcom/leanplum/internal/LeanplumInternal$8$1$2;-><init>(Lcom/leanplum/internal/LeanplumInternal$8$1;)V

    invoke-virtual {v0, v1}, Lcom/leanplum/internal/Request;->onError(Lcom/leanplum/internal/Request$ErrorCallback;)V

    invoke-static {}, Lcom/leanplum/internal/RequestSender;->getInstance()Lcom/leanplum/internal/RequestSender;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V

    return-void
.end method
