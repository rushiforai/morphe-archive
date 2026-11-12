.class public final Llel;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lknf;


# instance fields
.field public final a:Lpde;

.field public final b:Lshf;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/opera/android/browser/OperaPageRootView;

.field public final e:Lcr2;

.field public final f:Lqt3;

.field public final g:Lumi;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "[A-Za-z]{2}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpde;Ljava/lang/String;Lumi;)V
    .registers 79

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v0, Llel;->a:Lpde;

    move-object/from16 v4, p3

    iput-object v4, v0, Llel;->c:Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f0d0407

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f0a008d

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v11, v8

    check-cast v11, Lcom/google/android/material/button/MaterialButton;

    if-eqz v11, :cond_90a

    const v5, 0x7f0a0093

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v12, v8

    check-cast v12, Lcom/google/android/material/button/MaterialButton;

    if-eqz v12, :cond_90a

    const v5, 0x7f0a00e7

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a015d

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0161

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Landroid/widget/LinearLayout;

    if-eqz v13, :cond_90a

    const v5, 0x7f0a0162

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v14, v8

    check-cast v14, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v14, :cond_90a

    const v5, 0x7f0a0208

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_90a

    const v5, 0x7f0a0222

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v16, v8

    check-cast v16, Landroid/widget/LinearLayout;

    if-eqz v16, :cond_90a

    const v5, 0x7f0a0223

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v17, v8

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_90a

    const v5, 0x7f0a0225

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0226

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0236

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v18, v8

    check-cast v18, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v18, :cond_90a

    const v5, 0x7f0a0269

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v19, v8

    check-cast v19, Landroid/widget/ScrollView;

    if-eqz v19, :cond_90a

    const v5, 0x7f0a028f

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v20, v8

    check-cast v20, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v20, :cond_90a

    const v5, 0x7f0a0290

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0294

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v21, v8

    check-cast v21, Lcom/google/android/material/button/MaterialButton;

    if-eqz v21, :cond_90a

    const v5, 0x7f0a02d8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v22, v8

    check-cast v22, Landroid/widget/TextView;

    if-eqz v22, :cond_90a

    const v5, 0x7f0a02e9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03bb

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03bc

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03bd

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03be

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03bf

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03c1

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03c2

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a03c3

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0419

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a048d

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a049f

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v23, v8

    check-cast v23, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v23, :cond_90a

    const v5, 0x7f0a04a0

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v24, v8

    check-cast v24, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v24, :cond_90a

    const v5, 0x7f0a04a1

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v25, v8

    check-cast v25, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v25, :cond_90a

    const v5, 0x7f0a04a2

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v26, v8

    check-cast v26, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v26, :cond_90a

    const v5, 0x7f0a04bc

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a04c7

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v27, v8

    check-cast v27, Lcom/google/android/material/button/MaterialButton;

    if-eqz v27, :cond_90a

    const v5, 0x7f0a04c8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v28, v8

    check-cast v28, Landroid/widget/LinearLayout;

    if-eqz v28, :cond_90a

    const v5, 0x7f0a04c9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v29, v8

    check-cast v29, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v29, :cond_90a

    const v5, 0x7f0a04ca

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a04cb

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a058b

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v30, v8

    check-cast v30, Landroid/widget/LinearLayout;

    if-eqz v30, :cond_90a

    const v5, 0x7f0a058c

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v31, v8

    check-cast v31, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v31, :cond_90a

    const v5, 0x7f0a05a4

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a05f2

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v32, v8

    check-cast v32, Lcom/google/android/material/button/MaterialButton;

    if-eqz v32, :cond_90a

    const v5, 0x7f0a06c7

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v33, v8

    check-cast v33, Landroid/widget/LinearLayout;

    if-eqz v33, :cond_90a

    const v5, 0x7f0a06c8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v34, v8

    check-cast v34, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v34, :cond_90a

    const v5, 0x7f0a06cc

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0766

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v35, v8

    check-cast v35, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v35, :cond_90a

    const v5, 0x7f0a0781

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v36, v8

    check-cast v36, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v36, :cond_90a

    const v5, 0x7f0a079f

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v37, v8

    check-cast v37, Lcom/google/android/material/button/MaterialButton;

    if-eqz v37, :cond_90a

    const v5, 0x7f0a07a0

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v38, v8

    check-cast v38, Lcom/google/android/material/button/MaterialButton;

    if-eqz v38, :cond_90a

    const v5, 0x7f0a07a1

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v39, v8

    check-cast v39, Lcom/google/android/material/button/MaterialButton;

    if-eqz v39, :cond_90a

    const v5, 0x7f0a07a2

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v40, v8

    check-cast v40, Lcom/google/android/material/button/MaterialButton;

    if-eqz v40, :cond_90a

    const v5, 0x7f0a07a4

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v41, v8

    check-cast v41, Lcom/google/android/material/button/MaterialButton;

    if-eqz v41, :cond_90a

    const v5, 0x7f0a07b7

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0867

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v42, v8

    check-cast v42, Lcom/google/android/material/button/MaterialButton;

    if-eqz v42, :cond_90a

    const v5, 0x7f0a0888

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0889

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08d9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v43, v8

    check-cast v43, Lcom/google/android/material/button/MaterialButton;

    if-eqz v43, :cond_90a

    const v5, 0x7f0a08da

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08dc

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08de

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v44, v8

    check-cast v44, Lcom/google/android/material/button/MaterialButton;

    if-eqz v44, :cond_90a

    const v5, 0x7f0a08df

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08e2

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v45, v8

    check-cast v45, Landroid/widget/LinearLayout;

    if-eqz v45, :cond_90a

    const v5, 0x7f0a08e3

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v46, v8

    check-cast v46, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v46, :cond_90a

    const v5, 0x7f0a08e4

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08e6

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08ee

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08f8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a08f9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a09b9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v47, v8

    check-cast v47, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v47, :cond_90a

    const v5, 0x7f0a09bc

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v48, v8

    check-cast v48, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v48, :cond_90a

    const v5, 0x7f0a09c9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a09ce

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v49, v8

    check-cast v49, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v49, :cond_90a

    const v5, 0x7f0a09d4

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v50, v8

    check-cast v50, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v50, :cond_90a

    const v5, 0x7f0a09d6

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v51, v8

    check-cast v51, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v51, :cond_90a

    const v5, 0x7f0a09e8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v52, v8

    check-cast v52, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v52, :cond_90a

    const v5, 0x7f0a09eb

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/GridLayout;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a4a

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v53, v8

    check-cast v53, Landroid/widget/LinearLayout;

    if-eqz v53, :cond_90a

    const v5, 0x7f0a0a4b

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v54, v8

    check-cast v54, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v54, :cond_90a

    const v5, 0x7f0a0a53

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a54

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a56

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a58

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a59

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a5a

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a5b

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a5c

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a5d

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0a5e

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0ace

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0b18

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0b23

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v55, v8

    check-cast v55, Lcom/google/android/material/button/MaterialButton;

    if-eqz v55, :cond_90a

    const v5, 0x7f0a0bb0

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v56, v8

    check-cast v56, Lcom/google/android/material/button/MaterialButton;

    if-eqz v56, :cond_90a

    const v5, 0x7f0a0bf7

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0bf8

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0bf9

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0bfa

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    if-eqz v8, :cond_90a

    const v5, 0x7f0a0cbe

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v57, v8

    check-cast v57, Landroid/widget/LinearLayout;

    if-eqz v57, :cond_90a

    const v5, 0x7f0a0cbf

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v58, v8

    check-cast v58, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v58, :cond_90a

    const v5, 0x7f0a0ce0

    invoke-static {v5, v4}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v59, v8

    check-cast v59, Landroid/widget/TextView;

    if-eqz v59, :cond_90a

    new-instance v9, Lcr2;

    move-object v10, v4

    check-cast v10, Lcom/opera/android/browser/OperaPageRootView;

    invoke-direct/range {v9 .. v59}, Lcr2;-><init>(Lcom/opera/android/browser/OperaPageRootView;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/ScrollView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/TextView;)V

    move-object/from16 v8, v16

    move-object/from16 v4, v17

    move-object/from16 v11, v28

    move-object/from16 v1, v29

    move-object/from16 v5, v30

    move-object/from16 v60, v32

    move-object/from16 v61, v35

    move-object/from16 v62, v36

    move-object/from16 v63, v43

    move-object/from16 v64, v44

    move-object/from16 v12, v45

    move-object/from16 v6, v46

    move-object/from16 v65, v47

    move-object/from16 v66, v48

    move-object/from16 v67, v49

    move-object/from16 v68, v50

    move-object/from16 v69, v51

    move-object/from16 v70, v52

    move-object/from16 v71, v55

    move-object/from16 v72, v56

    move-object/from16 v7, v57

    move-object/from16 v15, v58

    move-object/from16 v73, v59

    move-object/from16 v17, v13

    move-object v13, v9

    move-object/from16 v9, v19

    move-object/from16 v19, v14

    move-object v14, v10

    move-object/from16 v10, v31

    iput-object v13, v0, Llel;->e:Lcr2;

    iput-object v14, v0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    move-object/from16 v22, v14

    new-instance v14, Lshf;

    invoke-direct {v14, v2, v9}, Lshf;-><init>(Lpde;Landroid/widget/ScrollView;)V

    iput-object v14, v0, Llel;->b:Lshf;

    iput-object v3, v0, Llel;->g:Lumi;

    invoke-static {v10, v5}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    invoke-static {v6, v12}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    invoke-static {v4, v8}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    invoke-static {v1, v11}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    invoke-static {v15, v7}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    move-object/from16 v8, v17

    move-object/from16 v14, v19

    invoke-static {v14, v8}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    move-object/from16 v8, v53

    move-object/from16 v1, v54

    invoke-static {v1, v8}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    move-object/from16 v8, v33

    move-object/from16 v1, v34

    invoke-static {v1, v8}, Llel;->f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->l()Lgc7;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lgc7;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lgc7;->b:Lay;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfc7;

    iget-object v1, v1, Lfc7;->c:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v66

    invoke-virtual {v8, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Letg;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5ba

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Letg;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v5, Letg;->a:Lnx1;

    invoke-virtual {v5, v2}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lctg;

    if-eqz v2, :cond_597

    iget-object v2, v2, Lctg;->b:Ljava/lang/String;

    goto :goto_598

    :cond_597
    const/4 v2, 0x0

    :goto_598
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v5, v2}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lctg;

    if-eqz v2, :cond_5ad

    iget-object v2, v2, Lctg;->c:Ljava/lang/String;

    goto :goto_5ae

    :cond_5ad
    const/4 v2, 0x0

    :goto_5ae
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v8, v70

    invoke-static {v8, v1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    :cond_5ba
    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lhs3;->a:Ln9a;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v8, v65

    invoke-static {v8, v1}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    sget-object v1, Ld59;->e:Ld59;

    move-object/from16 v8, v25

    invoke-virtual {v0, v8, v1}, Llel;->c(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ld59;)V

    sget-object v1, Ld59;->a:Ld59;

    move-object/from16 v8, v23

    invoke-virtual {v0, v8, v1}, Llel;->c(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ld59;)V

    sget-object v1, Ld59;->d:Ld59;

    move-object/from16 v8, v24

    invoke-virtual {v0, v8, v1}, Llel;->c(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ld59;)V

    sget-object v1, Ld59;->g:Ld59;

    move-object/from16 v8, v26

    invoke-virtual {v0, v8, v1}, Llel;->c(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ld59;)V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2, v1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5fb

    new-instance v4, Lqxh;

    invoke-direct {v4, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_5f8
    move-object/from16 v8, v67

    goto :goto_5fd

    :cond_5fb
    const/4 v4, 0x0

    goto :goto_5f8

    :goto_5fd
    invoke-virtual {v8, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v1, Ljy4;

    const/4 v4, 0x2

    invoke-direct {v1, v4}, Ljy4;-><init>(B)V

    invoke-virtual {v8, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Ltz5;->c()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v5, "crash.last.upload.status"

    const-string v6, ""

    invoke-interface {v1, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    const-string v6, "\n"

    if-nez v5, :cond_64d

    invoke-static {}, Ltz5;->c()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v7, "crash.last.upload.timestamp"

    const-wide/16 v8, 0x0

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    invoke-static {v1, v6}, Lp3p;->r(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v7, v8}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v7, Lqxh;

    invoke-direct {v7, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v68

    invoke-virtual {v8, v7}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v5, Lzt;

    const/16 v7, 0x10

    invoke-direct {v5, v1, v7}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v8, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_64d
    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v1

    iget-object v5, v1, Lm9c;->b:Lb59;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v7, "min_interval"

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    if-ltz v5, :cond_684

    invoke-virtual {v1}, Lm9c;->b()Ljava/lang/String;

    move-result-object v1

    new-instance v5, Lqxh;

    invoke-direct {v5, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v69

    invoke-virtual {v8, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v1, Lj4k;

    invoke-direct {v1, v2}, Lj4k;-><init>(B)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_684
    const/16 v1, 0x8

    move-object/from16 v8, v60

    invoke-virtual {v8, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "newsfeed"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string v8, "user_host"

    const/4 v10, 0x0

    invoke-interface {v7, v8, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_6ac

    const-string v11, "user_id"

    invoke-interface {v7, v11, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_6ae

    :cond_6ac
    const/4 v10, 0x0

    goto :goto_6b3

    :cond_6ae
    new-instance v10, Lsre;

    invoke-direct {v10, v8, v7, v9}, Lsre;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    :goto_6b3
    if-eqz v10, :cond_6cc

    const-string v7, "Newsfeed host = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v10, Lsre;->a:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "\nNewsfeed device id = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v10, Lsre;->b:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6cc
    new-instance v6, Lqxh;

    invoke-direct {v6, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v61

    invoke-virtual {v8, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v5, Lkel;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v8, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    sget-object v5, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {}, LJ/N;->MW43PylU()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-nez v5, :cond_6ea

    const-string v5, "Unknown cluster"

    :cond_6ea
    sget-object v6, Lcom/opera/android/browser/obml/Platform;->g:Ljava/lang/String;

    if-eqz v6, :cond_6f4

    const-string v7, " "

    invoke-static {v5, v7, v6}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_6f4
    new-instance v6, Lqxh;

    invoke-direct {v6, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v62

    invoke-virtual {v8, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v5, Ljava/io/File;

    sget-object v6, Lsnf;->a:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljjg;

    const/16 v7, 0xb

    invoke-direct {v6, v5, v7}, Ljjg;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v3, v6}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v5

    new-instance v6, Lqb6;

    move-object/from16 v8, v20

    invoke-direct {v6, v8}, Lqb6;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    invoke-virtual {v3, v6}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v6

    invoke-virtual {v5, v6}, Lnml;->b(Lnml;)V

    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Lnml;->a(Ljava/lang/Object;)Loml;

    const-string v5, "General"

    const-string v6, "Campaign"

    invoke-static {v5, v6}, LJ/N;->MQ$xB7I2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, "No campaign set"

    invoke-static {v5, v6}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lqxh;

    invoke-direct {v6, v5}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object/from16 v8, v18

    invoke-virtual {v8, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    sget-object v5, Lpyn;->a:Ljava/util/HashSet;

    invoke-static {}, Landroid/webkit/WebView;->getCurrentWebViewPackage()Landroid/content/pm/PackageInfo;

    move-result-object v5

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "<b>WebView info</b><br><tt>"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v5, :cond_773

    const-string v9, "\tpackage = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "<br>\tversion = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "<br>"

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_773
    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v9, Lio7;->j:Lio7;

    sget-object v10, Lrwn;->k:Lioj;

    invoke-static {v5, v9, v10}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v5

    check-cast v5, Lrwn;

    invoke-virtual {v5}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqwn;

    const-string v9, "\tchrome blacklist = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v5, Lqwn;->a:Ljava/util/Set;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v9, "<br>\twebview blacklist = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v5, Lqwn;->b:Ljava/util/Set;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, "<br>\twebview usage = "

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v6, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v5, v5, Lxv1;->n1:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvwn;

    invoke-virtual {v5}, Lvwn;->a()Z

    move-result v5

    if-eqz v5, :cond_7b3

    const-string v5, "BLACKLISTED"

    goto :goto_7b5

    :cond_7b3
    const-string v5, "not blacklisted"

    :goto_7b5
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "<br></tt>"

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v5

    move-object/from16 v8, v73

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v5, Lvr3;

    new-instance v6, Lzzh;

    const/16 v8, 0x19

    invoke-direct {v6, v0, v8}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v5, v6}, Lvr3;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v6

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    new-instance v9, Ld5o;

    new-instance v10, Ly37;

    invoke-direct {v10, v8, v3}, Ly37;-><init>(Landroid/content/Context;Lumi;)V

    invoke-direct {v9, v10}, Ld5o;-><init>(Ln1;)V

    new-instance v8, Ld47;

    invoke-direct {v8, v6, v4}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v9, v8}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v6

    new-instance v8, Ld5o;

    new-instance v9, Lv37;

    const/4 v10, 0x0

    invoke-direct {v9, v3, v10}, Lv37;-><init>(Lumi;B)V

    invoke-direct {v8, v9}, Ld5o;-><init>(Ln1;)V

    new-instance v9, Ld47;

    const/4 v10, 0x3

    invoke-direct {v9, v6, v10}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v8, v9}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v6

    invoke-static {}, Landroid/app/ActivityManager;->isUserAMonkey()Z

    move-result v8

    if-eqz v8, :cond_819

    sget-object v8, Lz37;->b:Lz37;

    goto :goto_81b

    :cond_819
    sget-object v8, Lz37;->a:Lz37;

    :goto_81b
    invoke-virtual {v6, v8}, Ltt2;->run(Ljava/lang/Object;)V

    invoke-virtual {v5}, Lvr3;->b()Ltt2;

    move-result-object v6

    new-instance v8, Ld5o;

    new-instance v9, Lv37;

    invoke-direct {v9, v3, v2}, Lv37;-><init>(Lumi;B)V

    invoke-direct {v8, v9}, Ld5o;-><init>(Ln1;)V

    new-instance v3, Ld47;

    const/4 v9, 0x4

    invoke-direct {v3, v6, v9}, Ld47;-><init>(Ltt2;B)V

    invoke-virtual {v8, v3}, Ld5o;->y(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v5}, Lvr3;->d()V

    iget-object v3, v13, Lcr2;->k:Landroid/view/View;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    new-instance v5, Lic;

    invoke-direct {v5, v0, v7}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Ljel;

    invoke-direct {v3, v0, v10}, Ljel;-><init>(Llel;B)V

    move-object/from16 v8, v63

    invoke-virtual {v8, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v13, Lcr2;->d:Landroid/view/View;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    new-instance v5, Ljel;

    const/4 v8, 0x0

    invoke-direct {v5, v0, v8}, Ljel;-><init>(Llel;B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Ljel;

    invoke-direct {v3, v0, v9}, Ljel;-><init>(Llel;B)V

    move-object/from16 v8, v64

    invoke-virtual {v8, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v13, Lcr2;->f:Landroid/view/View;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    new-instance v5, Ln42;

    const/4 v6, 0x5

    invoke-direct {v5, v6}, Ln42;-><init>(B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v3, Lqt3;

    const/16 v5, 0x15

    move-object/from16 v6, p1

    invoke-direct {v3, v6, v5}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iput-object v3, v0, Llel;->f:Lqt3;

    iget-object v3, v13, Lcr2;->h:Ljava/lang/Object;

    check-cast v3, Lcom/google/android/material/button/MaterialButton;

    new-instance v5, Ljel;

    invoke-direct {v5, v0, v2}, Ljel;-><init>(Llel;B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Ln42;

    const/4 v3, 0x6

    invoke-direct {v2, v3}, Ln42;-><init>(B)V

    move-object/from16 v8, v71

    invoke-virtual {v8, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object/from16 v8, v72

    invoke-virtual {v8, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v13, Lcr2;->c:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->O()Leej;

    iget-object v2, v13, Lcr2;->m:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->y0()Lmm6;

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->O()Leej;

    iget-object v2, v13, Lcr2;->l:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->O()Leej;

    iget-object v2, v13, Lcr2;->e:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Lcom/opera/android/BrowserActivity;->O()Leej;

    iget-object v2, v13, Lcr2;->n:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->M()Lslk;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    iget-object v2, v6, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v6}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    iget-object v2, v13, Lcr2;->b:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v6}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->t()Lr9c;

    move-object/from16 v8, v21

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Ljel;

    invoke-direct {v1, v0, v4}, Ljel;-><init>(Llel;B)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_90a
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v10, 0x0

    throw v10
.end method

.method public static f(Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/view/View;)V
    .registers 4

    new-instance v0, Lj5g;

    const/16 v1, 0x14

    invoke-direct {v0, p1, p0, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final B()Likc;
    .registers 1

    iget-object p0, p0, Llel;->a:Lpde;

    return-object p0
.end method

.method public final E()V
    .registers 1

    return-void
.end method

.method public final F()V
    .registers 1

    return-void
.end method

.method public final a()V
    .registers 1

    return-void
.end method

.method public final b()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final c(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ld59;)V
    .registers 4

    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    invoke-virtual {p0, p2}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_19

    return-void

    :cond_19
    new-instance p2, Lqxh;

    invoke-direct {p2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance p0, Ljy4;

    const/4 p2, 0x3

    invoke-direct {p0, p2}, Ljy4;-><init>(B)V

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final d()V
    .registers 1

    return-void
.end method

.method public final e()V
    .registers 1

    return-void
.end method

.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Llel;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getView()Lcom/opera/android/browser/OperaPageRootView;
    .registers 1

    iget-object p0, p0, Llel;->d:Lcom/opera/android/browser/OperaPageRootView;

    return-object p0
.end method

.method public final n()Ljava/lang/String;
    .registers 1

    const-string p0, "Testpage"

    return-object p0
.end method

.method public final o()V
    .registers 2

    iget-object p0, p0, Llel;->e:Lcr2;

    iget-object p0, p0, Lcr2;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->smoothScrollBy(II)V

    return-void
.end method

.method public final q()V
    .registers 2

    iget-object p0, p0, Llel;->e:Lcr2;

    iget-object p0, p0, Lcr2;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/ScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroid/widget/ScrollView;->scrollTo(II)V

    return-void
.end method

.method public final r()V
    .registers 5

    iget-object p0, p0, Llel;->b:Lshf;

    iget-object v0, p0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-nez v1, :cond_25

    iget-object p0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmnf;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lmnf;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget p0, p0, Lmnf;->b:I

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPadding(IIII)V

    :cond_25
    return-void
.end method

.method public final u()V
    .registers 1

    return-void
.end method

.method public final w()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final y()V
    .registers 1

    return-void
.end method

.method public final z()Ljava/lang/String;
    .registers 1

    const-string p0, "opera://tester"

    return-object p0
.end method
