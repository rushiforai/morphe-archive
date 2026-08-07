.class public Lcom/bef/effectsdk/EffectABConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final abDefaultInfo:Ljava/lang/String; = "[{\"key\": \"enable_level_1_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test ab config using level-1 AB config key\"},{\"key\" : \"enable_rt_mem_report\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether using rt mem report\"},{\"key\": \"enable_amazing_rt_share\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use amazing rendertexture share mode\"},{\"key\": \"enable_new_algorithm_system_node_parallel\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable node parallel executing, true for the node parallel executing, false for the serial executing.\"},{\"key\": \"enable_new_algorithm_system_node_parallel_version\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls algorithm system node parallel version\"},{\"key\": \"enable_new_algorithm_system_node_parallel_thread_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls algorithm system node parallel thread num\"},{\"key\": \"enable_face240_small_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240\"},{\"key\": \"enable_face240_small_resolution_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240 V2\"},{\"key\": \"enable_face240_small_resolution_for_high_input_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for high input resolution\"},{\"key\": \"enable_face106_large_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use large resolution for faceDetect106\"},{\"key\": \"effect_enable_facemiss_beauty_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use beauty optimization while face miss\"},{\"key\": \"enable_new_algorithm_system_native_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use CVPixelBuffer/AHardwareBuffer or glReadPixel to get pixel on iOS\"},{\"key\": \"enable_algoirthm_input_image_format_convert_in_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to convert algorithm input format from BGRA to RGBA in GPU on iOS\"},{\"key\": \"enable_face_async_model_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face CoreML async load or not\"},{\"key\": \"enable_algorithm_gpu_resize_with_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gpu_resize with buffer in render thread\"},{\"key\": \"enable_face_scale_smoother\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scale smoother in face module\"},{\"key\": \"face_extra_model_type\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Controls face extra model type for multi-models in face module\"},{\"key\": \"support_external_model_name\",\"dataType\": 1,\"defaultVal\": 3,\"description\": \"Support face & matting use external biz specify model name\"},{\"key\": \"enable_tt_face_extra_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_face_extra model mapping for scene\"},{\"key\": \"enable_tt_matting_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_matting model mapping for scene\"},{\"key\": \"algorithm_model_mapping\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Set algorithm model mapping for scene\"},{\"key\":\"enable_generaleffect_rtreuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use generaleffect local chain texture reuse\"},{\"key\": \"enable_gles30_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gles30 fence, true for using fence, false for not using fence.\"},{\"key\": \"enable_no_face_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable no face performance optimize\"},{\"key\": \"enable_schedule_vrsr\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr\"},{\"key\": \"enable_schedule_vrsr_for_segment\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr for segment\"},{\"key\": \"enable_vrsr_adaptor_for_only_render\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr adaptor for only render\"},{\"key\": \"enable_vrsr_init_async\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr init async\"},{\"key\": \"enable_schedule_vrsr_return_status\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to return vrsr status\"},{\"key\": \"enable_vrsr_algoType\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"vrsr algo type\"},{\"key\": \"enable_vrsr_downsampleOpt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr downsampleOpt\"},{\"key\": \"enable_vrsr_reset_frame_interval\",\"dataType\": 1,\"defaultVal\": 240,\"description\": \"vrsr reset interval frame count\"},{\"key\": \"enable_vrsr_vp_config\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set vrsr vp config\"},{\"key\": \"pesm_switch_render\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect render, true for using, false for not.\"},{\"key\": \"pesm_switch_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect features, true for using, false for not.\"},{\"key\": \"pesm_switch_terminal_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect terminal feature, true for using, false for not.\"},{\"key\": \"pesm_switch_algorithm\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect algorithm, true for using, false for not.\"},{\"key\": \"pesm_switch_frame_tools\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open frame tools, true for using, false for not.\"},{\"key\":\"enable_mv_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use mv render texture reuse\"},{\"key\":\"slam_algorithm_coexist\",\"dataType\":0,\"defaultVal\": false,\"description\": \"slam/ar_plane can coexist with other algorithms\"},{\"key\": \"enable_gl_crash_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use gl crash fix test\"},{\"key\":\"enable_feature_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature render texture reuse\"},{\"key\": \"enable_amazing_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to use asset async loading in amazing engine\"},{\"key\":\"enable_feature_ge_pool\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature generaleffect rt use same pool\"},{\"key\" : \"enable_faceMakeup_using_new_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether face makeup using new render engine\"},{\"key\" : \"enable_console_logging\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether printf in console output\"},{\"key\" : \"enable_build_in_sensor_service\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether use effect-sdk build in sensor service\"},{\"key\" : \"enable_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether upload applog_report\"},{\"key\": \"enable_amazing_filter_clear_by_agfx\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to clear output texture of amazing filter by AGFX API\"},{\"key\": \"enable_agfx_metalV2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable agfx metal v2 on ios\"},{\"key\": \"enable_create_texture_fail_fallback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use fallback strategy in FaceDistortionFaceu and FaceDistortionV3 when create texture fail, to skip this frame and retry to create texture in next frame.\"},{\"key\": \"enable_coexist_logic\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether the coexist logic work .\"},{\"key\": \"effect_working_color_space_linear\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls effect using linear/nolinear working color space. false: no-linear; true linear\"},{\"key\": \"enable_flipPatch_cube_3d_support\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable flipPatch\'s samplerCube and sampler3D support\"},{\"key\": \"enable_agfx_debug_layer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer\"},{\"key\": \"amazing_agfx_debug_layer_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"0-None, 1-Error, 2-Warning, 3-Info\"},{\"key\": \"enable_model_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize algorithm model loading\"},{\"key\": \"enable_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode png by OS API\"},{\"key\": \"enable_alpha_unpremul_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode alpha unpremultiplied png by OS API\"},{\"key\": \"enable_agfx_debug_layer_strict_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer strict mode\"},{\"key\": \"enable_agfx_texture_native_buffer_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX texture native buffer support\"},{\"key\": \"enable_async_load_anim_seq\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use async load anim seq, n(>=0) represent as async load n texture, n(<0) represent as async load all texture.\"},{\"key\": \"enable_set_external_Opacity\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable clients to set the facemakeup opacity\"},{\"key\": \"enable_horizontal_algorithm_refact\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Swap algorithmPreConfig\'s width and height in horizontal mode\"},{\"key\": \"enable_horizontal_algorithm_adapter\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Swap and compare algorithmPreConfig\'s width and height in horizontal mode for video feature manager\"},{\"key\": \"enable_javascript_in_befview\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use javascript in befview\"},{\"key\": \"enable_agfx_rendering_lib\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx rendering lib\"},{\"key\": \"enable_agfx_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx fence\"},{\"key\": \"enable_command_merge_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to merge blitCommand with renderCommand in agfx proxy\"},{\"key\": \"enable_texture_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture optimize in agfx proxy\"},{\"key\": \"enable_performance_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in agfx proxy\"},{\"key\": \"enable_replace_pop_push_to_resetState_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to replace pushstate popstate to resetstate in agfx proxy\"},{\"key\": \"enable_memory_allocator\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls when to use memory_allocator, 1 represent init time, 2 represent no effect time\"},{\"key\": \"memory_allocator_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory allocator size\uff0cusable when enable memory allocator\"},{\"key\": \"memory_allocator_unit_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory unit size\uff0cusable when enable memory allocator\"},{\"key\": \"use_absolute_timer\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"If true, timer use absolute chrono, else use timeStamp param-in\"},{\"key\": \"enable_infosticker_new_text_component\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"switch state for new text system.\"},{\"key\": \"effect_javascript_runtime_mode\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set javascript runtime  mode\"},{\"key\": \"enable_imageprocessor_preload_margin\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to load sequence frame with error margin\"},{\"key\": \"enable_shadow_rt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use shadow rt, replace pingpong rt\"},{\"key\": \"enable_angle_binary_program\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable Angle binary program\"},{\"key\": \"enable_amazing_faceMakeup_performance_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in amazing faceMakeup\"},{\"key\": \"enable_useEffectProcessor_inner_effect\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use parallel inner effect\"},{\"key\": \"enable_useEffectProcessor_ind_context\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use parallel inner effect with two independent contexts\"},{\"key\": \"enable_process_empty_requirements_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to handle empty requirement case in pipeline processor\"},{\"key\": \"enable_mesh_recalculatebounds_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use optimized recalculateBounds func or not\"},{\"key\": \"enable_faceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face makeup segmentation\"},{\"key\": \"enable_amgFaceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing face makeup segmentation\"},{\"key\": \"faceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of effect makeup type to enable segmentation\"},{\"key\": \"amgFaceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of amazing effect makeup type to to enable segmentation\"},{\"key\": \"enable_shadow_pass_lazy_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable shadow pass lazy load\"},{\"key\": \"enable_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm preload or not\"},{\"key\": \"enable_bach_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload or not\"},{\"key\": \"enable_bach_algorithm_preload_seteffect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload in set effect or not\"},{\"key\": \"enable_bach_algorithm_preload_default_algorithm\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload default algorithm or not\"},{\"key\": \"enable_befview_use_old_algorithm_result\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control befview whether to use old algorithm result\"},{\"key\": \"enable_amazing_scene_part_manager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing scene part manager\"},{\"key\": \"enable_performance_opt_in_terminal_and_general_effect_feature\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, optimize TerminalFeature and GeneralEffectFeature processing logic\"},{\"key\": \"enable_performance_opt_in_terminal_feature_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, fix optimize TerminalFeature processing logic\"},{\"key\": \"enable_algorithm_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize the timing of loading algorithms\"},{\"key\": \"enable_old_mv_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close old mv\"},{\"key\": \"enable_brush_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close brush2D feature\"},{\"key\": \"enable_facefitting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether facetitting algorithm should perform optimization\"},{\"key\": \"swing_segment_preload_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"swing segment create with resource loading, such as material compiling, the value is a bitwise combination of SegmentType, `Segment::initSegment` explains\"},{\"key\": \"enable_handleeffectevent_sync\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to call handleEffectEvent synchronously\"},{\"key\": \"enable_staged_job_pipeline\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use stagedJobPipeline framework to enable algorithm/render parallel\"},{\"key\": \"staged_job_pipeline_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Strategy about staged job pipeline (thread priority, spin count, command batch, etc.) .\"},{\"key\": \"use_mp4_android_hard_codec\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable Android hardware decode for new MP4\"},{\"key\": \"enable_migrate_msg_center_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of msg center threads to AsyncKit\"},{\"key\": \"migrate_msg_center_thread_max_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls migrating message center maximum thread number\"},{\"key\": \"enable_simd_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether is simd for web cc\"},{\"key\": \"enable_delay_thread_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether delay creation of threads for web cc\"},{\"key\": \"enable_et_data_capturing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open event tracking monitor, true for using, false for not.\"},{\"key\": \"enable_lua_script_type_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether lua type check\"},{\"key\" : \"effectab_reuse_algorithm_types\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"support reused mode algorithm types\"},{\"key\": \"enable_fs_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to open simd optimize\"},{\"key\": \"enable_remove_filter_program\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether remove filter program when deconstruct\"},{\"key\": \"bytenn_ab_test\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"bytenn ab test interface\"},{\"key\": \"enable_effect_network_url_checking\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to check validity of urls\"},{\"key\": \"enable_blitTexture_in_setInputTexture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to blitTexture in AEAlgorithm::setInputTexture\"},{\"key\": \"enable_get_rendererDevice_from_compute_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to get rendererDevice from bach compute_engine\"},{\"key\": \"enable_new_avatar3d\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to use new avatar3d model\"},{\"key\": \"effectab_text_cache_opt\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether to use text cache opt\"},{\"key\": \"enable_video_animseq_copy_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mp4 raw data copy optimize\"},{\"key\": \"enable_first_frame_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open first frame statistics, true for using, false for not.\"},{\"key\": \"enable_first_frame_breakdown\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to do first frame duration breakdown, true for doing, false for not.\"},{\"key\": \"disable_shader_script_sourcePath\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Disable shader sourcePath binding with script\"},{\"key\": \"enable_dynamic_pipeline_processor_switch\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable dynamic switch of pipeline processor\"},{\"key\": \"cpu_blitter_threshold\",\"dataType\": 1,\"defaultVal\": 256,\"description\": \"cpu blitter when smaller than the threshold\"},{\"key\": \"enable_fs_use_face_threads\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to use threads\"},   {\"key\": \"enable_slota\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable slotA\"},{\"key\": \"enable_pngSize_adapt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable png size adapt for resolution\"},{\"key\": \"enable_ahardwareBuffer_fd_leak_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable ahardwareBuffer fd leak fix\"},{\"key\": \"enable_if_comp_shader_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable create IF shader object with cache\"},{\"key\": \"enable_getframedata_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize getFrameData wait window\"},{\"key\": \"enable_pipelineprocessor_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize the pipeline processor\"},{\"key\": \"enable_sharing_JSManager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether JSManager is shared among scripts\"},{\"key\": \"enable_set_sticker_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether preload effect in first frame\"},{\"key\": \"effect_sdk_face_beauty_feature_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"setting face beauty feature log level\"},{\"key\": \"enable_transition_ii\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable new transition, which is not depend on EffectManager, or not\"},{\"key\": \"enable_skeleton_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skeleton to open optimize\"},{\"key\": \"set_log_level\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls log level\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"preload_blocklist\",\"dataType\": 3,\"defaultVal\": \"script,general_lens,cine_move,gpu_render,matting,texture_blit\",\"description\": \"Bach preload block list of algorithm type\"},{\"key\": \"enable_skin_seg_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skin_Seg to open simd optimize\"},{\"key\": \"enable_break_old_feature_in_renderCore\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core\"},{\"key\": \"enable_break_old_feature_in_renderCore_direct_return\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core direct return\"},{\"key\": \"main_route_sampler_interval\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Set the sampling interval for event tracking of ET_TYPE_MAIN_ROUTE_TRACKING.\"},{\"key\": \"enable_et_memory_pool\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable etMonitor memory pool.\"},{\"key\": \"enable_hairparser_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if hairparser to open simd optimize\"},{\"key\": \"matting_optimization_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether matting algorithm should perform Smash, script or BCE\"},{\"key\": \"enable_use_freid_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if use freid v2\"},{\"key\": \"effectab_enable_image_quality_down_sample\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether need to enable down sample while choosing image quality mode\"},{\"key\": \"enable_gift_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open gift event tracking, true for using, false for not.\"},{\"key\": \"enable_expand_message_post\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable expand message post scene\"},{\"key\": \"enable_track_share_effectnode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track shared effectNode strategy\"},{\"key\": \"enable_track_set_output_size\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track use the size different from main renderChain size\"},{\"key\": \"enable_renderchain_reconstruct_main_texture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable renderChain reconstruct\"},{\"key\": \"enable_track_enable_texture_attribute\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable_texture_attribute\"},{\"key\": \"enable_video_segment_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable swing videoSegment structural adjustment.\"},{\"key\": \"enable_segment_xshader_reuse\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable reuse of xshader in segment\"},{\"key\": \"enable_unified_midtexture_release_in_lowmemory_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable unified middle texture release in low memory mode.\"},{\"key\": \"enable_delay_bslot_effect_exclusion\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to delay mutual exclusion for b slot effect\"    },{\"key\": \"enable_fix_algorithm_resolution_change_twice\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"fix algorithm resolution change twice when input texture resolution changed.\"},{\"key\": \"enable_render_cache_string_set_license\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to set license to render cache string. key: effect_ab_license, value: license\"},{\"key\": \"new_algorithm_system_node_parallel_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"algorithm system node parallel setings\"},{\"key\": \"enable_auxiliary_texture_support_metal\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable green screen video support metal\"},{\"key\": \"enable_segment_manager_set_param_after_scene_updated\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to set param after scene updated in PrefabSegment\"},{\"key\": \"enable_segment_manager\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_set_picture_mode\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager set picture mode\"},{\"key\": \"enable_lock_algorithmTextureCache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to lock m_algorithmTextureCache\"},{\"key\": \"enable_mapstuck_check_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use map stuck check in pipeline processor\"},{\"key\": \"windows_use_dx\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether use dx full link for auto color\"},{\"key\": \"enable_deltatime_negative\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether deltaTime can be a negative number\"},{\"key\": \"enable_gpu_garbage_collect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable gpu garbage collect.\"},{\"key\": \"effect_resource_manager_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of effect resource manager\"},{\"key\": \"enable_sticker_add_user_string_value\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls the logic of adding user string value of the sticker.\"},{\"key\": \"enable_gift_send_full_link_tracking\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to post event tracking infos to gift full link platform\"},{\"key\": \"enable_rendercore_agfx_flush_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable RenderCore-AGFX glFlush optimize\"},{\"key\": \"enable_amazing_mp4_full_link_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 full link gpu\"},{\"key\": \"enable_amazing_mp4_async_decode_init\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 async decode init\"},{\"key\": \"enable_composer_id_map_find_lock\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Control whether to turn on composer id map find lock\"},{\"key\": \"enable_egl_fence_in_algorithm\",\"dataType\":0,\"defaultVal\": true,\"description\": \"Controls whether to use egl fence in algorithm\"},{\"key\": \"enable_rhi_frame_reuse_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to reuse ve output in rhi\"},{\"key\": \"enable_delay_frame_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to delay ve output frame in single thread\"},{\"key\": \"enable_sharing_JSManager_reserved\",\"dataType\":1,\"defaultVal\": 0,\"description\": \"Controls whether to reserve bach js manager\"},{\"key\": \"enable_bach_jsobject_defer_bind\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind bach js object\"},{\"key\": \"enable_amazing_makeup_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use amazing makeup fetch.\"},{\"key\": \"enable_multi_render_device_effect_node\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable multi render device effect node, such as metal on ios\"},{\"key\": \"enable_amg_pass_pipeline_refator\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable the refactor of AMGPass pipeline\"},{\"key\": \"enable_fix_amg_transform_negative_scale\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix AMGTransform\'s negative scale\"},{\"key\": \"enable_render_system_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix dangling pointer in render system\"},{\"key\": \"enable_amazing_builtin_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable Amazing BuiltIn optimize\"},{\"key\": \"enable_framebuffer_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable FrameBufferFetch With New Pass\'s useFBOFetchWithBlackList\"},{\"key\": \"enable_mesh_data_dirty_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mesh data dirty check[optimization(v1) found in large-scene]\"},{\"key\": \"enable_large_scene_optimize_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v2) found in large-scene\"},{\"key\": \"enable_large_scene_optimize_v4\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v4) found in large-scene\"},{\"key\": \"enable_camera_rt_backup\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls if use backup RT to replace render input when it is same as camera RT\"},{\"key\": \"enable_jazz_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to call jazz init in Amazer::init\"},{\"key\": \"enable_load_js_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"support loading js as cache.\"},{\"key\": \"enable_preload_jssystemscript_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"preload jssystemscript as cache during resource loading.\"},{\"key\": \"enable_jsobjectmanager_in_runtime\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"use jsobjectmanager to reuse jsobject in runtime\"},{\"key\": \"use_executors_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using executors 2.0\"},{\"key\": \"basic_local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"basic_global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of local Executors used by AsyncAsset\"},{\"key\": \"enable_fix_post_event_in_on_event\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable fix postEvent in onEvent deadlock\"},{\"key\": \"use_global_executors\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using global executors used by AsyncAsset\"},{\"key\": \"global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of global Executors used by AsyncAsset\"},{\"key\": \"enable_js_shared_memory\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether js shared memory is enabled\"},{\"key\": \"enable_js_rtti_defer_binding\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind RTTI interface to JS script\"},{\"key\": \"enable_asset_async_executor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async executor used by AsyncAsset\"},{\"key\": \"asset_async_executor_cpu_thread_nums\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Asset async load cpu thread nums used by AsyncAsset\"},{\"key\": \"asset_async_executor_enable_anim_seq\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async load for anim sequence\"},{\"key\": \"enable_textsystem_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable textSystem init optimize\"},{\"key\": \"enable_register_js_callback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if we register truly existing js callback functions into lists.\"},{\"key\": \"animseq_preload_prediction_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the preload prediction strategy of animseq\"},{\"key\": \"animseq_preload_count\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the preload count of animseq\"},{\"key\": \"effectab_anim_seq_cache\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"AnimSeqCache\"},{\"key\": \"anim_seq_cache_sink_atlas\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether sink animSeq cache from AnimSeq to ImageAtlas\"},{\"key\": \"enable_gif_anim_seq_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Cache of GifAnimSeq and GifAsset\"},{\"key\": \"enable_gif_gpu_decoding\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"GPU Decoding of GifAsset\"},{\"key\": \"enable_file_access_tracker_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Log unknown/unregistered file access originating from Lua.\"},{\"key\": \"enable_file_allow_list_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable allow list protection for Lua\"},{\"key\": \"enable_system_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable optimize system constructor, onStart and onUpdate\"},{\"key\": \"enable_fix_async_loader_pointer2\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Async loader fix protection second patch\"},{\"key\": \"enable_migrate_async_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of async threads to AsyncKit\"},{\"key\": \"host_address_for_framedebug\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"host address for framedebug\"},{\"key\": \"enable_event_center_listener_thread_safe\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable event center listener thread safe\"},{\"key\": \"enable_video_anim_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable AMGVideoAnimSeq use vecodec\"},{\"key\": \"async_assets_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"async assets setting\"},{\"key\": \"enable_decode_png_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use vecodec decode png\"},{\"key\": \"enable_use_agfx_pipeline_props_def\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable use_agfx pipeline props define\"},{\"key\": \"enable_js_delay_release\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use delay release strategy in js\"},{\"key\": \"enable_text_sdf_cache_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split of four-channel sdf texture.\"},{\"key\": \"enable_text_blend_layer_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split text blending.\"},{\"key\": \"animseq_preload_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"\"},{\"key\": \"animseq_cache_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"enable_draw_driven_shader_build_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable draw driven shader building.Currently only support Mac platform.\"},{\"key\": \"lua_gc_throttle_wait_time\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the minimal interval time of lua gc in milliseconds\"},{\"key\": \"enable_scene_asset_preloader\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scene asset preloader\"},{\"key\": \"enable_hdr_sticker_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable to support hdr gif and video sticker.\"},{\"key\": \"enable_system_list_load_limit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, The effect package loading system-list limit is enabled when called the scene onStart.\"},{\"key\": \"effectab_device_texture_cache_size_limit\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Device texture cache size\"},{\"key\": \"enable_BACH_TEST_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test BACH AB config key\"},{\"key\": \"enable_face_extra_gpu_bce\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable face extra gpu bce link or not\"},{\"key\": \"enable_face_detect_ability_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable face detect_ability_fix or not\"},{\"key\": \"enable_face_bce_gpu_mask\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable full GPU chain for face, mouth and teeth mask\"},{\"key\": \"enable_face_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for face extra\"},{\"key\": \"enable_matting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether matting algorithm should perform BCE\"},{\"key\": \"enable_idream_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for iDream\"},{\"key\": \"bce_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"BCE(Bach compute engine) settings\"},{\"key\": \"enable_bach_performance_monit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether whether to enable performance monit in bach\"},{\"key\": \"enable_bach_performance_monit_param\",\"dataType\": 3,\"defaultVal\": \"0,100\",\"description\": \"Controls the performance monitoring probability and frequency (per val ms) \"},{\"key\": \"bach_asyn_report_delayed_frames\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of frames to be delayed when bach reports\"},{\"key\": \"bach_asyn_report_per_frame_report_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of bach reports to be reported per frame\"},{\"key\": \"enable_bach_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use Applog in Bach\"},{\"key\": \"enable_bach_windows_swing_dx_sharing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use windows dx sharing\"},{\"key\": \"enable_bach_read_fp16_pixelbuffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whethe to enable read fp16 cvPixelBuffer input in blit node\"},{\"key\": \"enable_script_init_async_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls script init async or not\"}]"

.field public static gJniOnloadThreadOnceEnabled:Z

.field private static final licenseSupportedAB:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bef/effectsdk/EffectABConfig;->licenseSupportedAB:Ljava/util/Map;

    .line 7
    .line 8
    const-string v1, "enable_schedule_vrsr"

    .line 9
    .line 10
    filled-new-array {v1}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v3, "ve_edit|preview"

    .line 19
    .line 20
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    filled-new-array {v1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "ve_edit|compile"

    .line 32
    .line 33
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    sput-boolean v0, Lcom/bef/effectsdk/EffectABConfig;->gJniOnloadThreadOnceEnabled:Z

    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static enableJniOnloadThreadOnce(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/bef/effectsdk/EffectABConfig;->gJniOnloadThreadOnceEnabled:Z

    .line 2
    .line 3
    return-void
.end method

.method public static getABInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "[{\"key\": \"enable_level_1_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test ab config using level-1 AB config key\"},{\"key\" : \"enable_rt_mem_report\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether using rt mem report\"},{\"key\": \"enable_amazing_rt_share\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use amazing rendertexture share mode\"},{\"key\": \"enable_new_algorithm_system_node_parallel\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable node parallel executing, true for the node parallel executing, false for the serial executing.\"},{\"key\": \"enable_new_algorithm_system_node_parallel_version\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls algorithm system node parallel version\"},{\"key\": \"enable_new_algorithm_system_node_parallel_thread_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls algorithm system node parallel thread num\"},{\"key\": \"enable_face240_small_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240\"},{\"key\": \"enable_face240_small_resolution_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240 V2\"},{\"key\": \"enable_face240_small_resolution_for_high_input_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for high input resolution\"},{\"key\": \"enable_face106_large_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use large resolution for faceDetect106\"},{\"key\": \"effect_enable_facemiss_beauty_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use beauty optimization while face miss\"},{\"key\": \"enable_new_algorithm_system_native_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use CVPixelBuffer/AHardwareBuffer or glReadPixel to get pixel on iOS\"},{\"key\": \"enable_algoirthm_input_image_format_convert_in_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to convert algorithm input format from BGRA to RGBA in GPU on iOS\"},{\"key\": \"enable_face_async_model_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face CoreML async load or not\"},{\"key\": \"enable_algorithm_gpu_resize_with_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gpu_resize with buffer in render thread\"},{\"key\": \"enable_face_scale_smoother\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scale smoother in face module\"},{\"key\": \"face_extra_model_type\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Controls face extra model type for multi-models in face module\"},{\"key\": \"support_external_model_name\",\"dataType\": 1,\"defaultVal\": 3,\"description\": \"Support face & matting use external biz specify model name\"},{\"key\": \"enable_tt_face_extra_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_face_extra model mapping for scene\"},{\"key\": \"enable_tt_matting_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_matting model mapping for scene\"},{\"key\": \"algorithm_model_mapping\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Set algorithm model mapping for scene\"},{\"key\":\"enable_generaleffect_rtreuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use generaleffect local chain texture reuse\"},{\"key\": \"enable_gles30_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gles30 fence, true for using fence, false for not using fence.\"},{\"key\": \"enable_no_face_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable no face performance optimize\"},{\"key\": \"enable_schedule_vrsr\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr\"},{\"key\": \"enable_schedule_vrsr_for_segment\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr for segment\"},{\"key\": \"enable_vrsr_adaptor_for_only_render\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr adaptor for only render\"},{\"key\": \"enable_vrsr_init_async\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr init async\"},{\"key\": \"enable_schedule_vrsr_return_status\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to return vrsr status\"},{\"key\": \"enable_vrsr_algoType\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"vrsr algo type\"},{\"key\": \"enable_vrsr_downsampleOpt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr downsampleOpt\"},{\"key\": \"enable_vrsr_reset_frame_interval\",\"dataType\": 1,\"defaultVal\": 240,\"description\": \"vrsr reset interval frame count\"},{\"key\": \"enable_vrsr_vp_config\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set vrsr vp config\"},{\"key\": \"pesm_switch_render\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect render, true for using, false for not.\"},{\"key\": \"pesm_switch_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect features, true for using, false for not.\"},{\"key\": \"pesm_switch_terminal_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect terminal feature, true for using, false for not.\"},{\"key\": \"pesm_switch_algorithm\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect algorithm, true for using, false for not.\"},{\"key\": \"pesm_switch_frame_tools\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open frame tools, true for using, false for not.\"},{\"key\":\"enable_mv_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use mv render texture reuse\"},{\"key\":\"slam_algorithm_coexist\",\"dataType\":0,\"defaultVal\": false,\"description\": \"slam/ar_plane can coexist with other algorithms\"},{\"key\": \"enable_gl_crash_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use gl crash fix test\"},{\"key\":\"enable_feature_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature render texture reuse\"},{\"key\": \"enable_amazing_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to use asset async loading in amazing engine\"},{\"key\":\"enable_feature_ge_pool\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature generaleffect rt use same pool\"},{\"key\" : \"enable_faceMakeup_using_new_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether face makeup using new render engine\"},{\"key\" : \"enable_console_logging\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether printf in console output\"},{\"key\" : \"enable_build_in_sensor_service\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether use effect-sdk build in sensor service\"},{\"key\" : \"enable_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether upload applog_report\"},{\"key\": \"enable_amazing_filter_clear_by_agfx\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to clear output texture of amazing filter by AGFX API\"},{\"key\": \"enable_agfx_metalV2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable agfx metal v2 on ios\"},{\"key\": \"enable_create_texture_fail_fallback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use fallback strategy in FaceDistortionFaceu and FaceDistortionV3 when create texture fail, to skip this frame and retry to create texture in next frame.\"},{\"key\": \"enable_coexist_logic\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether the coexist logic work .\"},{\"key\": \"effect_working_color_space_linear\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls effect using linear/nolinear working color space. false: no-linear; true linear\"},{\"key\": \"enable_flipPatch_cube_3d_support\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable flipPatch\'s samplerCube and sampler3D support\"},{\"key\": \"enable_agfx_debug_layer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer\"},{\"key\": \"amazing_agfx_debug_layer_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"0-None, 1-Error, 2-Warning, 3-Info\"},{\"key\": \"enable_model_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize algorithm model loading\"},{\"key\": \"enable_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode png by OS API\"},{\"key\": \"enable_alpha_unpremul_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode alpha unpremultiplied png by OS API\"},{\"key\": \"enable_agfx_debug_layer_strict_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer strict mode\"},{\"key\": \"enable_agfx_texture_native_buffer_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX texture native buffer support\"},{\"key\": \"enable_async_load_anim_seq\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use async load anim seq, n(>=0) represent as async load n texture, n(<0) represent as async load all texture.\"},{\"key\": \"enable_set_external_Opacity\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable clients to set the facemakeup opacity\"},{\"key\": \"enable_horizontal_algorithm_refact\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Swap algorithmPreConfig\'s width and height in horizontal mode\"},{\"key\": \"enable_horizontal_algorithm_adapter\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Swap and compare algorithmPreConfig\'s width and height in horizontal mode for video feature manager\"},{\"key\": \"enable_javascript_in_befview\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use javascript in befview\"},{\"key\": \"enable_agfx_rendering_lib\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx rendering lib\"},{\"key\": \"enable_agfx_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx fence\"},{\"key\": \"enable_command_merge_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to merge blitCommand with renderCommand in agfx proxy\"},{\"key\": \"enable_texture_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture optimize in agfx proxy\"},{\"key\": \"enable_performance_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in agfx proxy\"},{\"key\": \"enable_replace_pop_push_to_resetState_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to replace pushstate popstate to resetstate in agfx proxy\"},{\"key\": \"enable_memory_allocator\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls when to use memory_allocator, 1 represent init time, 2 represent no effect time\"},{\"key\": \"memory_allocator_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory allocator size\uff0cusable when enable memory allocator\"},{\"key\": \"memory_allocator_unit_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory unit size\uff0cusable when enable memory allocator\"},{\"key\": \"use_absolute_timer\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"If true, timer use absolute chrono, else use timeStamp param-in\"},{\"key\": \"enable_infosticker_new_text_component\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"switch state for new text system.\"},{\"key\": \"effect_javascript_runtime_mode\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set javascript runtime  mode\"},{\"key\": \"enable_imageprocessor_preload_margin\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to load sequence frame with error margin\"},{\"key\": \"enable_shadow_rt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use shadow rt, replace pingpong rt\"},{\"key\": \"enable_angle_binary_program\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable Angle binary program\"},{\"key\": \"enable_amazing_faceMakeup_performance_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in amazing faceMakeup\"},{\"key\": \"enable_useEffectProcessor_inner_effect\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use parallel inner effect\"},{\"key\": \"enable_useEffectProcessor_ind_context\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use parallel inner effect with two independent contexts\"},{\"key\": \"enable_process_empty_requirements_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to handle empty requirement case in pipeline processor\"},{\"key\": \"enable_mesh_recalculatebounds_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use optimized recalculateBounds func or not\"},{\"key\": \"enable_faceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face makeup segmentation\"},{\"key\": \"enable_amgFaceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing face makeup segmentation\"},{\"key\": \"faceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of effect makeup type to enable segmentation\"},{\"key\": \"amgFaceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of amazing effect makeup type to to enable segmentation\"},{\"key\": \"enable_shadow_pass_lazy_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable shadow pass lazy load\"},{\"key\": \"enable_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm preload or not\"},{\"key\": \"enable_bach_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload or not\"},{\"key\": \"enable_bach_algorithm_preload_seteffect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload in set effect or not\"},{\"key\": \"enable_bach_algorithm_preload_default_algorithm\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload default algorithm or not\"},{\"key\": \"enable_befview_use_old_algorithm_result\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control befview whether to use old algorithm result\"},{\"key\": \"enable_amazing_scene_part_manager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing scene part manager\"},{\"key\": \"enable_performance_opt_in_terminal_and_general_effect_feature\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, optimize TerminalFeature and GeneralEffectFeature processing logic\"},{\"key\": \"enable_performance_opt_in_terminal_feature_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, fix optimize TerminalFeature processing logic\"},{\"key\": \"enable_algorithm_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize the timing of loading algorithms\"},{\"key\": \"enable_old_mv_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close old mv\"},{\"key\": \"enable_brush_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close brush2D feature\"},{\"key\": \"enable_facefitting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether facetitting algorithm should perform optimization\"},{\"key\": \"swing_segment_preload_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"swing segment create with resource loading, such as material compiling, the value is a bitwise combination of SegmentType, `Segment::initSegment` explains\"},{\"key\": \"enable_handleeffectevent_sync\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to call handleEffectEvent synchronously\"},{\"key\": \"enable_staged_job_pipeline\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use stagedJobPipeline framework to enable algorithm/render parallel\"},{\"key\": \"staged_job_pipeline_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Strategy about staged job pipeline (thread priority, spin count, command batch, etc.) .\"},{\"key\": \"use_mp4_android_hard_codec\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable Android hardware decode for new MP4\"},{\"key\": \"enable_migrate_msg_center_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of msg center threads to AsyncKit\"},{\"key\": \"migrate_msg_center_thread_max_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls migrating message center maximum thread number\"},{\"key\": \"enable_simd_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether is simd for web cc\"},{\"key\": \"enable_delay_thread_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether delay creation of threads for web cc\"},{\"key\": \"enable_et_data_capturing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open event tracking monitor, true for using, false for not.\"},{\"key\": \"enable_lua_script_type_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether lua type check\"},{\"key\" : \"effectab_reuse_algorithm_types\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"support reused mode algorithm types\"},{\"key\": \"enable_fs_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to open simd optimize\"},{\"key\": \"enable_remove_filter_program\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether remove filter program when deconstruct\"},{\"key\": \"bytenn_ab_test\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"bytenn ab test interface\"},{\"key\": \"enable_effect_network_url_checking\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to check validity of urls\"},{\"key\": \"enable_blitTexture_in_setInputTexture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to blitTexture in AEAlgorithm::setInputTexture\"},{\"key\": \"enable_get_rendererDevice_from_compute_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to get rendererDevice from bach compute_engine\"},{\"key\": \"enable_new_avatar3d\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to use new avatar3d model\"},{\"key\": \"effectab_text_cache_opt\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether to use text cache opt\"},{\"key\": \"enable_video_animseq_copy_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mp4 raw data copy optimize\"},{\"key\": \"enable_first_frame_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open first frame statistics, true for using, false for not.\"},{\"key\": \"enable_first_frame_breakdown\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to do first frame duration breakdown, true for doing, false for not.\"},{\"key\": \"disable_shader_script_sourcePath\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Disable shader sourcePath binding with script\"},{\"key\": \"enable_dynamic_pipeline_processor_switch\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable dynamic switch of pipeline processor\"},{\"key\": \"cpu_blitter_threshold\",\"dataType\": 1,\"defaultVal\": 256,\"description\": \"cpu blitter when smaller than the threshold\"},{\"key\": \"enable_fs_use_face_threads\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to use threads\"},   {\"key\": \"enable_slota\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable slotA\"},{\"key\": \"enable_pngSize_adapt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable png size adapt for resolution\"},{\"key\": \"enable_ahardwareBuffer_fd_leak_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable ahardwareBuffer fd leak fix\"},{\"key\": \"enable_if_comp_shader_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable create IF shader object with cache\"},{\"key\": \"enable_getframedata_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize getFrameData wait window\"},{\"key\": \"enable_pipelineprocessor_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize the pipeline processor\"},{\"key\": \"enable_sharing_JSManager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether JSManager is shared among scripts\"},{\"key\": \"enable_set_sticker_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether preload effect in first frame\"},{\"key\": \"effect_sdk_face_beauty_feature_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"setting face beauty feature log level\"},{\"key\": \"enable_transition_ii\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable new transition, which is not depend on EffectManager, or not\"},{\"key\": \"enable_skeleton_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skeleton to open optimize\"},{\"key\": \"set_log_level\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls log level\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"preload_blocklist\",\"dataType\": 3,\"defaultVal\": \"script,general_lens,cine_move,gpu_render,matting,texture_blit\",\"description\": \"Bach preload block list of algorithm type\"},{\"key\": \"enable_skin_seg_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skin_Seg to open simd optimize\"},{\"key\": \"enable_break_old_feature_in_renderCore\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core\"},{\"key\": \"enable_break_old_feature_in_renderCore_direct_return\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core direct return\"},{\"key\": \"main_route_sampler_interval\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Set the sampling interval for event tracking of ET_TYPE_MAIN_ROUTE_TRACKING.\"},{\"key\": \"enable_et_memory_pool\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable etMonitor memory pool.\"},{\"key\": \"enable_hairparser_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if hairparser to open simd optimize\"},{\"key\": \"matting_optimization_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether matting algorithm should perform Smash, script or BCE\"},{\"key\": \"enable_use_freid_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if use freid v2\"},{\"key\": \"effectab_enable_image_quality_down_sample\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether need to enable down sample while choosing image quality mode\"},{\"key\": \"enable_gift_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open gift event tracking, true for using, false for not.\"},{\"key\": \"enable_expand_message_post\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable expand message post scene\"},{\"key\": \"enable_track_share_effectnode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track shared effectNode strategy\"},{\"key\": \"enable_track_set_output_size\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track use the size different from main renderChain size\"},{\"key\": \"enable_renderchain_reconstruct_main_texture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable renderChain reconstruct\"},{\"key\": \"enable_track_enable_texture_attribute\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable_texture_attribute\"},{\"key\": \"enable_video_segment_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable swing videoSegment structural adjustment.\"},{\"key\": \"enable_segment_xshader_reuse\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable reuse of xshader in segment\"},{\"key\": \"enable_unified_midtexture_release_in_lowmemory_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable unified middle texture release in low memory mode.\"},{\"key\": \"enable_delay_bslot_effect_exclusion\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to delay mutual exclusion for b slot effect\"    },{\"key\": \"enable_fix_algorithm_resolution_change_twice\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"fix algorithm resolution change twice when input texture resolution changed.\"},{\"key\": \"enable_render_cache_string_set_license\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to set license to render cache string. key: effect_ab_license, value: license\"},{\"key\": \"new_algorithm_system_node_parallel_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"algorithm system node parallel setings\"},{\"key\": \"enable_auxiliary_texture_support_metal\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable green screen video support metal\"},{\"key\": \"enable_segment_manager_set_param_after_scene_updated\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to set param after scene updated in PrefabSegment\"},{\"key\": \"enable_segment_manager\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_set_picture_mode\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager set picture mode\"},{\"key\": \"enable_lock_algorithmTextureCache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to lock m_algorithmTextureCache\"},{\"key\": \"enable_mapstuck_check_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use map stuck check in pipeline processor\"},{\"key\": \"windows_use_dx\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether use dx full link for auto color\"},{\"key\": \"enable_deltatime_negative\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether deltaTime can be a negative number\"},{\"key\": \"enable_gpu_garbage_collect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable gpu garbage collect.\"},{\"key\": \"effect_resource_manager_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of effect resource manager\"},{\"key\": \"enable_sticker_add_user_string_value\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls the logic of adding user string value of the sticker.\"},{\"key\": \"enable_gift_send_full_link_tracking\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to post event tracking infos to gift full link platform\"},{\"key\": \"enable_rendercore_agfx_flush_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable RenderCore-AGFX glFlush optimize\"},{\"key\": \"enable_amazing_mp4_full_link_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 full link gpu\"},{\"key\": \"enable_amazing_mp4_async_decode_init\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 async decode init\"},{\"key\": \"enable_composer_id_map_find_lock\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Control whether to turn on composer id map find lock\"},{\"key\": \"enable_egl_fence_in_algorithm\",\"dataType\":0,\"defaultVal\": true,\"description\": \"Controls whether to use egl fence in algorithm\"},{\"key\": \"enable_rhi_frame_reuse_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to reuse ve output in rhi\"},{\"key\": \"enable_delay_frame_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to delay ve output frame in single thread\"},{\"key\": \"enable_sharing_JSManager_reserved\",\"dataType\":1,\"defaultVal\": 0,\"description\": \"Controls whether to reserve bach js manager\"},{\"key\": \"enable_bach_jsobject_defer_bind\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind bach js object\"},{\"key\": \"enable_amazing_makeup_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use amazing makeup fetch.\"},{\"key\": \"enable_multi_render_device_effect_node\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable multi render device effect node, such as metal on ios\"},{\"key\": \"enable_amg_pass_pipeline_refator\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable the refactor of AMGPass pipeline\"},{\"key\": \"enable_fix_amg_transform_negative_scale\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix AMGTransform\'s negative scale\"},{\"key\": \"enable_render_system_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix dangling pointer in render system\"},{\"key\": \"enable_amazing_builtin_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable Amazing BuiltIn optimize\"},{\"key\": \"enable_framebuffer_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable FrameBufferFetch With New Pass\'s useFBOFetchWithBlackList\"},{\"key\": \"enable_mesh_data_dirty_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mesh data dirty check[optimization(v1) found in large-scene]\"},{\"key\": \"enable_large_scene_optimize_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v2) found in large-scene\"},{\"key\": \"enable_large_scene_optimize_v4\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v4) found in large-scene\"},{\"key\": \"enable_camera_rt_backup\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls if use backup RT to replace render input when it is same as camera RT\"},{\"key\": \"enable_jazz_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to call jazz init in Amazer::init\"},{\"key\": \"enable_load_js_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"support loading js as cache.\"},{\"key\": \"enable_preload_jssystemscript_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"preload jssystemscript as cache during resource loading.\"},{\"key\": \"enable_jsobjectmanager_in_runtime\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"use jsobjectmanager to reuse jsobject in runtime\"},{\"key\": \"use_executors_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using executors 2.0\"},{\"key\": \"basic_local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"basic_global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of local Executors used by AsyncAsset\"},{\"key\": \"enable_fix_post_event_in_on_event\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable fix postEvent in onEvent deadlock\"},{\"key\": \"use_global_executors\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using global executors used by AsyncAsset\"},{\"key\": \"global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of global Executors used by AsyncAsset\"},{\"key\": \"enable_js_shared_memory\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether js shared memory is enabled\"},{\"key\": \"enable_js_rtti_defer_binding\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind RTTI interface to JS script\"},{\"key\": \"enable_asset_async_executor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async executor used by AsyncAsset\"},{\"key\": \"asset_async_executor_cpu_thread_nums\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Asset async load cpu thread nums used by AsyncAsset\"},{\"key\": \"asset_async_executor_enable_anim_seq\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async load for anim sequence\"},{\"key\": \"enable_textsystem_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable textSystem init optimize\"},{\"key\": \"enable_register_js_callback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if we register truly existing js callback functions into lists.\"},{\"key\": \"animseq_preload_prediction_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the preload prediction strategy of animseq\"},{\"key\": \"animseq_preload_count\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the preload count of animseq\"},{\"key\": \"effectab_anim_seq_cache\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"AnimSeqCache\"},{\"key\": \"anim_seq_cache_sink_atlas\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether sink animSeq cache from AnimSeq to ImageAtlas\"},{\"key\": \"enable_gif_anim_seq_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Cache of GifAnimSeq and GifAsset\"},{\"key\": \"enable_gif_gpu_decoding\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"GPU Decoding of GifAsset\"},{\"key\": \"enable_file_access_tracker_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Log unknown/unregistered file access originating from Lua.\"},{\"key\": \"enable_file_allow_list_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable allow list protection for Lua\"},{\"key\": \"enable_system_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable optimize system constructor, onStart and onUpdate\"},{\"key\": \"enable_fix_async_loader_pointer2\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Async loader fix protection second patch\"},{\"key\": \"enable_migrate_async_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of async threads to AsyncKit\"},{\"key\": \"host_address_for_framedebug\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"host address for framedebug\"},{\"key\": \"enable_event_center_listener_thread_safe\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable event center listener thread safe\"},{\"key\": \"enable_video_anim_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable AMGVideoAnimSeq use vecodec\"},{\"key\": \"async_assets_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"async assets setting\"},{\"key\": \"enable_decode_png_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use vecodec decode png\"},{\"key\": \"enable_use_agfx_pipeline_props_def\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable use_agfx pipeline props define\"},{\"key\": \"enable_js_delay_release\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use delay release strategy in js\"},{\"key\": \"enable_text_sdf_cache_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split of four-channel sdf texture.\"},{\"key\": \"enable_text_blend_layer_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split text blending.\"},{\"key\": \"animseq_preload_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"\"},{\"key\": \"animseq_cache_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"enable_draw_driven_shader_build_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable draw driven shader building.Currently only support Mac platform.\"},{\"key\": \"lua_gc_throttle_wait_time\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the minimal interval time of lua gc in milliseconds\"},{\"key\": \"enable_scene_asset_preloader\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scene asset preloader\"},{\"key\": \"enable_hdr_sticker_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable to support hdr gif and video sticker.\"},{\"key\": \"enable_system_list_load_limit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, The effect package loading system-list limit is enabled when called the scene onStart.\"},{\"key\": \"effectab_device_texture_cache_size_limit\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Device texture cache size\"},{\"key\": \"enable_BACH_TEST_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test BACH AB config key\"},{\"key\": \"enable_face_extra_gpu_bce\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable face extra gpu bce link or not\"},{\"key\": \"enable_face_detect_ability_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable face detect_ability_fix or not\"},{\"key\": \"enable_face_bce_gpu_mask\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable full GPU chain for face, mouth and teeth mask\"},{\"key\": \"enable_face_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for face extra\"},{\"key\": \"enable_matting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether matting algorithm should perform BCE\"},{\"key\": \"enable_idream_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for iDream\"},{\"key\": \"bce_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"BCE(Bach compute engine) settings\"},{\"key\": \"enable_bach_performance_monit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether whether to enable performance monit in bach\"},{\"key\": \"enable_bach_performance_monit_param\",\"dataType\": 3,\"defaultVal\": \"0,100\",\"description\": \"Controls the performance monitoring probability and frequency (per val ms) \"},{\"key\": \"bach_asyn_report_delayed_frames\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of frames to be delayed when bach reports\"},{\"key\": \"bach_asyn_report_per_frame_report_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of bach reports to be reported per frame\"},{\"key\": \"enable_bach_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use Applog in Bach\"},{\"key\": \"enable_bach_windows_swing_dx_sharing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use windows dx sharing\"},{\"key\": \"enable_bach_read_fp16_pixelbuffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whethe to enable read fp16 cvPixelBuffer input in blit node\"},{\"key\": \"enable_script_init_async_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls script init async or not\"}]"

    .line 2
    .line 3
    if-eqz p0, :cond_5

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    goto :goto_3

    .line 12
    :cond_0
    sget-object v1, Lcom/bef/effectsdk/EffectABConfig;->licenseSupportedAB:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_1
    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ljava/util/HashSet;

    .line 28
    .line 29
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception p0

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    new-instance p0, Lorg/json/JSONArray;

    .line 55
    .line 56
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 57
    .line 58
    .line 59
    new-instance v2, Lorg/json/JSONArray;

    .line 60
    .line 61
    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-ge v3, v4, :cond_4

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lorg/json/JSONObject;

    .line 76
    .line 77
    const-string v5, "key"

    .line 78
    .line 79
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-eqz v5, :cond_3

    .line 88
    .line 89
    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 90
    .line 91
    .line 92
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    return-object p0

    .line 100
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    .line 102
    .line 103
    :cond_5
    :goto_3
    return-object v0
.end method

.method public static isJniOnloadThreadOnceEnabled()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/bef/effectsdk/EffectABConfig;->gJniOnloadThreadOnceEnabled:Z

    .line 2
    .line 3
    return v0
.end method

.method public static requestABInfoWithLicense(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    const-string v1, "[{\"key\": \"enable_level_1_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test ab config using level-1 AB config key\"},{\"key\" : \"enable_rt_mem_report\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether using rt mem report\"},{\"key\": \"enable_amazing_rt_share\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use amazing rendertexture share mode\"},{\"key\": \"enable_new_algorithm_system_node_parallel\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable node parallel executing, true for the node parallel executing, false for the serial executing.\"},{\"key\": \"enable_new_algorithm_system_node_parallel_version\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls algorithm system node parallel version\"},{\"key\": \"enable_new_algorithm_system_node_parallel_thread_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls algorithm system node parallel thread num\"},{\"key\": \"enable_face240_small_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240\"},{\"key\": \"enable_face240_small_resolution_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240 V2\"},{\"key\": \"enable_face240_small_resolution_for_high_input_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for high input resolution\"},{\"key\": \"enable_face106_large_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use large resolution for faceDetect106\"},{\"key\": \"effect_enable_facemiss_beauty_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use beauty optimization while face miss\"},{\"key\": \"enable_new_algorithm_system_native_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use CVPixelBuffer/AHardwareBuffer or glReadPixel to get pixel on iOS\"},{\"key\": \"enable_algoirthm_input_image_format_convert_in_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to convert algorithm input format from BGRA to RGBA in GPU on iOS\"},{\"key\": \"enable_face_async_model_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face CoreML async load or not\"},{\"key\": \"enable_algorithm_gpu_resize_with_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gpu_resize with buffer in render thread\"},{\"key\": \"enable_face_scale_smoother\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scale smoother in face module\"},{\"key\": \"face_extra_model_type\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Controls face extra model type for multi-models in face module\"},{\"key\": \"support_external_model_name\",\"dataType\": 1,\"defaultVal\": 3,\"description\": \"Support face & matting use external biz specify model name\"},{\"key\": \"enable_tt_face_extra_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_face_extra model mapping for scene\"},{\"key\": \"enable_tt_matting_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_matting model mapping for scene\"},{\"key\": \"algorithm_model_mapping\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Set algorithm model mapping for scene\"},{\"key\":\"enable_generaleffect_rtreuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use generaleffect local chain texture reuse\"},{\"key\": \"enable_gles30_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gles30 fence, true for using fence, false for not using fence.\"},{\"key\": \"enable_no_face_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable no face performance optimize\"},{\"key\": \"enable_schedule_vrsr\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr\"},{\"key\": \"enable_schedule_vrsr_for_segment\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr for segment\"},{\"key\": \"enable_vrsr_adaptor_for_only_render\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr adaptor for only render\"},{\"key\": \"enable_vrsr_init_async\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr init async\"},{\"key\": \"enable_schedule_vrsr_return_status\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to return vrsr status\"},{\"key\": \"enable_vrsr_algoType\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"vrsr algo type\"},{\"key\": \"enable_vrsr_downsampleOpt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr downsampleOpt\"},{\"key\": \"enable_vrsr_reset_frame_interval\",\"dataType\": 1,\"defaultVal\": 240,\"description\": \"vrsr reset interval frame count\"},{\"key\": \"enable_vrsr_vp_config\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set vrsr vp config\"},{\"key\": \"pesm_switch_render\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect render, true for using, false for not.\"},{\"key\": \"pesm_switch_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect features, true for using, false for not.\"},{\"key\": \"pesm_switch_terminal_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect terminal feature, true for using, false for not.\"},{\"key\": \"pesm_switch_algorithm\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect algorithm, true for using, false for not.\"},{\"key\": \"pesm_switch_frame_tools\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open frame tools, true for using, false for not.\"},{\"key\":\"enable_mv_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use mv render texture reuse\"},{\"key\":\"slam_algorithm_coexist\",\"dataType\":0,\"defaultVal\": false,\"description\": \"slam/ar_plane can coexist with other algorithms\"},{\"key\": \"enable_gl_crash_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use gl crash fix test\"},{\"key\":\"enable_feature_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature render texture reuse\"},{\"key\": \"enable_amazing_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to use asset async loading in amazing engine\"},{\"key\":\"enable_feature_ge_pool\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature generaleffect rt use same pool\"},{\"key\" : \"enable_faceMakeup_using_new_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether face makeup using new render engine\"},{\"key\" : \"enable_console_logging\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether printf in console output\"},{\"key\" : \"enable_build_in_sensor_service\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether use effect-sdk build in sensor service\"},{\"key\" : \"enable_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether upload applog_report\"},{\"key\": \"enable_amazing_filter_clear_by_agfx\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to clear output texture of amazing filter by AGFX API\"},{\"key\": \"enable_agfx_metalV2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable agfx metal v2 on ios\"},{\"key\": \"enable_create_texture_fail_fallback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use fallback strategy in FaceDistortionFaceu and FaceDistortionV3 when create texture fail, to skip this frame and retry to create texture in next frame.\"},{\"key\": \"enable_coexist_logic\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether the coexist logic work .\"},{\"key\": \"effect_working_color_space_linear\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls effect using linear/nolinear working color space. false: no-linear; true linear\"},{\"key\": \"enable_flipPatch_cube_3d_support\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable flipPatch\'s samplerCube and sampler3D support\"},{\"key\": \"enable_agfx_debug_layer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer\"},{\"key\": \"amazing_agfx_debug_layer_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"0-None, 1-Error, 2-Warning, 3-Info\"},{\"key\": \"enable_model_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize algorithm model loading\"},{\"key\": \"enable_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode png by OS API\"},{\"key\": \"enable_alpha_unpremul_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode alpha unpremultiplied png by OS API\"},{\"key\": \"enable_agfx_debug_layer_strict_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer strict mode\"},{\"key\": \"enable_agfx_texture_native_buffer_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX texture native buffer support\"},{\"key\": \"enable_async_load_anim_seq\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use async load anim seq, n(>=0) represent as async load n texture, n(<0) represent as async load all texture.\"},{\"key\": \"enable_set_external_Opacity\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable clients to set the facemakeup opacity\"},{\"key\": \"enable_horizontal_algorithm_refact\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Swap algorithmPreConfig\'s width and height in horizontal mode\"},{\"key\": \"enable_horizontal_algorithm_adapter\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Swap and compare algorithmPreConfig\'s width and height in horizontal mode for video feature manager\"},{\"key\": \"enable_javascript_in_befview\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use javascript in befview\"},{\"key\": \"enable_agfx_rendering_lib\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx rendering lib\"},{\"key\": \"enable_agfx_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx fence\"},{\"key\": \"enable_command_merge_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to merge blitCommand with renderCommand in agfx proxy\"},{\"key\": \"enable_texture_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture optimize in agfx proxy\"},{\"key\": \"enable_performance_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in agfx proxy\"},{\"key\": \"enable_replace_pop_push_to_resetState_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to replace pushstate popstate to resetstate in agfx proxy\"},{\"key\": \"enable_memory_allocator\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls when to use memory_allocator, 1 represent init time, 2 represent no effect time\"},{\"key\": \"memory_allocator_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory allocator size\uff0cusable when enable memory allocator\"},{\"key\": \"memory_allocator_unit_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory unit size\uff0cusable when enable memory allocator\"},{\"key\": \"use_absolute_timer\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"If true, timer use absolute chrono, else use timeStamp param-in\"},{\"key\": \"enable_infosticker_new_text_component\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"switch state for new text system.\"},{\"key\": \"effect_javascript_runtime_mode\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set javascript runtime  mode\"},{\"key\": \"enable_imageprocessor_preload_margin\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to load sequence frame with error margin\"},{\"key\": \"enable_shadow_rt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use shadow rt, replace pingpong rt\"},{\"key\": \"enable_angle_binary_program\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable Angle binary program\"},{\"key\": \"enable_amazing_faceMakeup_performance_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in amazing faceMakeup\"},{\"key\": \"enable_useEffectProcessor_inner_effect\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use parallel inner effect\"},{\"key\": \"enable_useEffectProcessor_ind_context\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use parallel inner effect with two independent contexts\"},{\"key\": \"enable_process_empty_requirements_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to handle empty requirement case in pipeline processor\"},{\"key\": \"enable_mesh_recalculatebounds_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use optimized recalculateBounds func or not\"},{\"key\": \"enable_faceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face makeup segmentation\"},{\"key\": \"enable_amgFaceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing face makeup segmentation\"},{\"key\": \"faceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of effect makeup type to enable segmentation\"},{\"key\": \"amgFaceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of amazing effect makeup type to to enable segmentation\"},{\"key\": \"enable_shadow_pass_lazy_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable shadow pass lazy load\"},{\"key\": \"enable_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm preload or not\"},{\"key\": \"enable_bach_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload or not\"},{\"key\": \"enable_bach_algorithm_preload_seteffect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload in set effect or not\"},{\"key\": \"enable_bach_algorithm_preload_default_algorithm\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload default algorithm or not\"},{\"key\": \"enable_befview_use_old_algorithm_result\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control befview whether to use old algorithm result\"},{\"key\": \"enable_amazing_scene_part_manager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing scene part manager\"},{\"key\": \"enable_performance_opt_in_terminal_and_general_effect_feature\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, optimize TerminalFeature and GeneralEffectFeature processing logic\"},{\"key\": \"enable_performance_opt_in_terminal_feature_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, fix optimize TerminalFeature processing logic\"},{\"key\": \"enable_algorithm_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize the timing of loading algorithms\"},{\"key\": \"enable_old_mv_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close old mv\"},{\"key\": \"enable_brush_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close brush2D feature\"},{\"key\": \"enable_facefitting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether facetitting algorithm should perform optimization\"},{\"key\": \"swing_segment_preload_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"swing segment create with resource loading, such as material compiling, the value is a bitwise combination of SegmentType, `Segment::initSegment` explains\"},{\"key\": \"enable_handleeffectevent_sync\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to call handleEffectEvent synchronously\"},{\"key\": \"enable_staged_job_pipeline\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use stagedJobPipeline framework to enable algorithm/render parallel\"},{\"key\": \"staged_job_pipeline_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Strategy about staged job pipeline (thread priority, spin count, command batch, etc.) .\"},{\"key\": \"use_mp4_android_hard_codec\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable Android hardware decode for new MP4\"},{\"key\": \"enable_migrate_msg_center_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of msg center threads to AsyncKit\"},{\"key\": \"migrate_msg_center_thread_max_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls migrating message center maximum thread number\"},{\"key\": \"enable_simd_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether is simd for web cc\"},{\"key\": \"enable_delay_thread_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether delay creation of threads for web cc\"},{\"key\": \"enable_et_data_capturing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open event tracking monitor, true for using, false for not.\"},{\"key\": \"enable_lua_script_type_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether lua type check\"},{\"key\" : \"effectab_reuse_algorithm_types\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"support reused mode algorithm types\"},{\"key\": \"enable_fs_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to open simd optimize\"},{\"key\": \"enable_remove_filter_program\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether remove filter program when deconstruct\"},{\"key\": \"bytenn_ab_test\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"bytenn ab test interface\"},{\"key\": \"enable_effect_network_url_checking\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to check validity of urls\"},{\"key\": \"enable_blitTexture_in_setInputTexture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to blitTexture in AEAlgorithm::setInputTexture\"},{\"key\": \"enable_get_rendererDevice_from_compute_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to get rendererDevice from bach compute_engine\"},{\"key\": \"enable_new_avatar3d\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to use new avatar3d model\"},{\"key\": \"effectab_text_cache_opt\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether to use text cache opt\"},{\"key\": \"enable_video_animseq_copy_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mp4 raw data copy optimize\"},{\"key\": \"enable_first_frame_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open first frame statistics, true for using, false for not.\"},{\"key\": \"enable_first_frame_breakdown\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to do first frame duration breakdown, true for doing, false for not.\"},{\"key\": \"disable_shader_script_sourcePath\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Disable shader sourcePath binding with script\"},{\"key\": \"enable_dynamic_pipeline_processor_switch\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable dynamic switch of pipeline processor\"},{\"key\": \"cpu_blitter_threshold\",\"dataType\": 1,\"defaultVal\": 256,\"description\": \"cpu blitter when smaller than the threshold\"},{\"key\": \"enable_fs_use_face_threads\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to use threads\"},   {\"key\": \"enable_slota\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable slotA\"},{\"key\": \"enable_pngSize_adapt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable png size adapt for resolution\"},{\"key\": \"enable_ahardwareBuffer_fd_leak_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable ahardwareBuffer fd leak fix\"},{\"key\": \"enable_if_comp_shader_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable create IF shader object with cache\"},{\"key\": \"enable_getframedata_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize getFrameData wait window\"},{\"key\": \"enable_pipelineprocessor_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize the pipeline processor\"},{\"key\": \"enable_sharing_JSManager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether JSManager is shared among scripts\"},{\"key\": \"enable_set_sticker_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether preload effect in first frame\"},{\"key\": \"effect_sdk_face_beauty_feature_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"setting face beauty feature log level\"},{\"key\": \"enable_transition_ii\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable new transition, which is not depend on EffectManager, or not\"},{\"key\": \"enable_skeleton_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skeleton to open optimize\"},{\"key\": \"set_log_level\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls log level\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"preload_blocklist\",\"dataType\": 3,\"defaultVal\": \"script,general_lens,cine_move,gpu_render,matting,texture_blit\",\"description\": \"Bach preload block list of algorithm type\"},{\"key\": \"enable_skin_seg_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skin_Seg to open simd optimize\"},{\"key\": \"enable_break_old_feature_in_renderCore\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core\"},{\"key\": \"enable_break_old_feature_in_renderCore_direct_return\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core direct return\"},{\"key\": \"main_route_sampler_interval\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Set the sampling interval for event tracking of ET_TYPE_MAIN_ROUTE_TRACKING.\"},{\"key\": \"enable_et_memory_pool\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable etMonitor memory pool.\"},{\"key\": \"enable_hairparser_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if hairparser to open simd optimize\"},{\"key\": \"matting_optimization_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether matting algorithm should perform Smash, script or BCE\"},{\"key\": \"enable_use_freid_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if use freid v2\"},{\"key\": \"effectab_enable_image_quality_down_sample\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether need to enable down sample while choosing image quality mode\"},{\"key\": \"enable_gift_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open gift event tracking, true for using, false for not.\"},{\"key\": \"enable_expand_message_post\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable expand message post scene\"},{\"key\": \"enable_track_share_effectnode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track shared effectNode strategy\"},{\"key\": \"enable_track_set_output_size\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track use the size different from main renderChain size\"},{\"key\": \"enable_renderchain_reconstruct_main_texture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable renderChain reconstruct\"},{\"key\": \"enable_track_enable_texture_attribute\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable_texture_attribute\"},{\"key\": \"enable_video_segment_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable swing videoSegment structural adjustment.\"},{\"key\": \"enable_segment_xshader_reuse\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable reuse of xshader in segment\"},{\"key\": \"enable_unified_midtexture_release_in_lowmemory_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable unified middle texture release in low memory mode.\"},{\"key\": \"enable_delay_bslot_effect_exclusion\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to delay mutual exclusion for b slot effect\"    },{\"key\": \"enable_fix_algorithm_resolution_change_twice\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"fix algorithm resolution change twice when input texture resolution changed.\"},{\"key\": \"enable_render_cache_string_set_license\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to set license to render cache string. key: effect_ab_license, value: license\"},{\"key\": \"new_algorithm_system_node_parallel_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"algorithm system node parallel setings\"},{\"key\": \"enable_auxiliary_texture_support_metal\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable green screen video support metal\"},{\"key\": \"enable_segment_manager_set_param_after_scene_updated\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to set param after scene updated in PrefabSegment\"},{\"key\": \"enable_segment_manager\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_set_picture_mode\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager set picture mode\"},{\"key\": \"enable_lock_algorithmTextureCache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to lock m_algorithmTextureCache\"},{\"key\": \"enable_mapstuck_check_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use map stuck check in pipeline processor\"},{\"key\": \"windows_use_dx\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether use dx full link for auto color\"},{\"key\": \"enable_deltatime_negative\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether deltaTime can be a negative number\"},{\"key\": \"enable_gpu_garbage_collect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable gpu garbage collect.\"},{\"key\": \"effect_resource_manager_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of effect resource manager\"},{\"key\": \"enable_sticker_add_user_string_value\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls the logic of adding user string value of the sticker.\"},{\"key\": \"enable_gift_send_full_link_tracking\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to post event tracking infos to gift full link platform\"},{\"key\": \"enable_rendercore_agfx_flush_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable RenderCore-AGFX glFlush optimize\"},{\"key\": \"enable_amazing_mp4_full_link_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 full link gpu\"},{\"key\": \"enable_amazing_mp4_async_decode_init\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 async decode init\"},{\"key\": \"enable_composer_id_map_find_lock\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Control whether to turn on composer id map find lock\"},{\"key\": \"enable_egl_fence_in_algorithm\",\"dataType\":0,\"defaultVal\": true,\"description\": \"Controls whether to use egl fence in algorithm\"},{\"key\": \"enable_rhi_frame_reuse_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to reuse ve output in rhi\"},{\"key\": \"enable_delay_frame_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to delay ve output frame in single thread\"},{\"key\": \"enable_sharing_JSManager_reserved\",\"dataType\":1,\"defaultVal\": 0,\"description\": \"Controls whether to reserve bach js manager\"},{\"key\": \"enable_bach_jsobject_defer_bind\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind bach js object\"},{\"key\": \"enable_amazing_makeup_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use amazing makeup fetch.\"},{\"key\": \"enable_multi_render_device_effect_node\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable multi render device effect node, such as metal on ios\"},{\"key\": \"enable_amg_pass_pipeline_refator\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable the refactor of AMGPass pipeline\"},{\"key\": \"enable_fix_amg_transform_negative_scale\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix AMGTransform\'s negative scale\"},{\"key\": \"enable_render_system_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix dangling pointer in render system\"},{\"key\": \"enable_amazing_builtin_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable Amazing BuiltIn optimize\"},{\"key\": \"enable_framebuffer_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable FrameBufferFetch With New Pass\'s useFBOFetchWithBlackList\"},{\"key\": \"enable_mesh_data_dirty_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mesh data dirty check[optimization(v1) found in large-scene]\"},{\"key\": \"enable_large_scene_optimize_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v2) found in large-scene\"},{\"key\": \"enable_large_scene_optimize_v4\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v4) found in large-scene\"},{\"key\": \"enable_camera_rt_backup\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls if use backup RT to replace render input when it is same as camera RT\"},{\"key\": \"enable_jazz_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to call jazz init in Amazer::init\"},{\"key\": \"enable_load_js_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"support loading js as cache.\"},{\"key\": \"enable_preload_jssystemscript_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"preload jssystemscript as cache during resource loading.\"},{\"key\": \"enable_jsobjectmanager_in_runtime\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"use jsobjectmanager to reuse jsobject in runtime\"},{\"key\": \"use_executors_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using executors 2.0\"},{\"key\": \"basic_local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"basic_global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of local Executors used by AsyncAsset\"},{\"key\": \"enable_fix_post_event_in_on_event\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable fix postEvent in onEvent deadlock\"},{\"key\": \"use_global_executors\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using global executors used by AsyncAsset\"},{\"key\": \"global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of global Executors used by AsyncAsset\"},{\"key\": \"enable_js_shared_memory\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether js shared memory is enabled\"},{\"key\": \"enable_js_rtti_defer_binding\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind RTTI interface to JS script\"},{\"key\": \"enable_asset_async_executor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async executor used by AsyncAsset\"},{\"key\": \"asset_async_executor_cpu_thread_nums\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Asset async load cpu thread nums used by AsyncAsset\"},{\"key\": \"asset_async_executor_enable_anim_seq\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async load for anim sequence\"},{\"key\": \"enable_textsystem_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable textSystem init optimize\"},{\"key\": \"enable_register_js_callback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if we register truly existing js callback functions into lists.\"},{\"key\": \"animseq_preload_prediction_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the preload prediction strategy of animseq\"},{\"key\": \"animseq_preload_count\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the preload count of animseq\"},{\"key\": \"effectab_anim_seq_cache\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"AnimSeqCache\"},{\"key\": \"anim_seq_cache_sink_atlas\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether sink animSeq cache from AnimSeq to ImageAtlas\"},{\"key\": \"enable_gif_anim_seq_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Cache of GifAnimSeq and GifAsset\"},{\"key\": \"enable_gif_gpu_decoding\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"GPU Decoding of GifAsset\"},{\"key\": \"enable_file_access_tracker_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Log unknown/unregistered file access originating from Lua.\"},{\"key\": \"enable_file_allow_list_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable allow list protection for Lua\"},{\"key\": \"enable_system_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable optimize system constructor, onStart and onUpdate\"},{\"key\": \"enable_fix_async_loader_pointer2\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Async loader fix protection second patch\"},{\"key\": \"enable_migrate_async_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of async threads to AsyncKit\"},{\"key\": \"host_address_for_framedebug\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"host address for framedebug\"},{\"key\": \"enable_event_center_listener_thread_safe\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable event center listener thread safe\"},{\"key\": \"enable_video_anim_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable AMGVideoAnimSeq use vecodec\"},{\"key\": \"async_assets_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"async assets setting\"},{\"key\": \"enable_decode_png_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use vecodec decode png\"},{\"key\": \"enable_use_agfx_pipeline_props_def\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable use_agfx pipeline props define\"},{\"key\": \"enable_js_delay_release\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use delay release strategy in js\"},{\"key\": \"enable_text_sdf_cache_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split of four-channel sdf texture.\"},{\"key\": \"enable_text_blend_layer_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split text blending.\"},{\"key\": \"animseq_preload_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"\"},{\"key\": \"animseq_cache_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"enable_draw_driven_shader_build_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable draw driven shader building.Currently only support Mac platform.\"},{\"key\": \"lua_gc_throttle_wait_time\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the minimal interval time of lua gc in milliseconds\"},{\"key\": \"enable_scene_asset_preloader\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scene asset preloader\"},{\"key\": \"enable_hdr_sticker_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable to support hdr gif and video sticker.\"},{\"key\": \"enable_system_list_load_limit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, The effect package loading system-list limit is enabled when called the scene onStart.\"},{\"key\": \"effectab_device_texture_cache_size_limit\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Device texture cache size\"},{\"key\": \"enable_BACH_TEST_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test BACH AB config key\"},{\"key\": \"enable_face_extra_gpu_bce\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable face extra gpu bce link or not\"},{\"key\": \"enable_face_detect_ability_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable face detect_ability_fix or not\"},{\"key\": \"enable_face_bce_gpu_mask\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable full GPU chain for face, mouth and teeth mask\"},{\"key\": \"enable_face_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for face extra\"},{\"key\": \"enable_matting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether matting algorithm should perform BCE\"},{\"key\": \"enable_idream_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for iDream\"},{\"key\": \"bce_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"BCE(Bach compute engine) settings\"},{\"key\": \"enable_bach_performance_monit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether whether to enable performance monit in bach\"},{\"key\": \"enable_bach_performance_monit_param\",\"dataType\": 3,\"defaultVal\": \"0,100\",\"description\": \"Controls the performance monitoring probability and frequency (per val ms) \"},{\"key\": \"bach_asyn_report_delayed_frames\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of frames to be delayed when bach reports\"},{\"key\": \"bach_asyn_report_per_frame_report_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of bach reports to be reported per frame\"},{\"key\": \"enable_bach_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use Applog in Bach\"},{\"key\": \"enable_bach_windows_swing_dx_sharing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use windows dx sharing\"},{\"key\": \"enable_bach_read_fp16_pixelbuffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whethe to enable read fp16 cvPixelBuffer input in blit node\"},{\"key\": \"enable_script_init_async_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls script init async or not\"}]"

    .line 4
    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto :goto_3

    .line 14
    :cond_0
    new-instance v2, Lorg/json/JSONArray;

    .line 15
    .line 16
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 17
    .line 18
    .line 19
    :try_start_0
    new-instance v3, Lorg/json/JSONArray;

    .line 20
    .line 21
    invoke-direct {v3, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    move v4, v1

    .line 26
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    if-ge v4, v5, :cond_1

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    check-cast v5, Lorg/json/JSONObject;

    .line 37
    .line 38
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 39
    .line 40
    .line 41
    add-int/lit8 v4, v4, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception p0

    .line 45
    goto :goto_2

    .line 46
    :cond_1
    new-instance v3, Lorg/json/JSONArray;

    .line 47
    .line 48
    invoke-static {p0}, Lcom/bef/effectsdk/EffectABConfig;->getABInfo(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    if-ge v1, v4, :cond_2

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Lorg/json/JSONObject;

    .line 66
    .line 67
    new-instance v5, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v6, "effect_config_"

    .line 73
    .line 74
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v6, "_"

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_3
    :goto_3
    return-object v1
.end method

.method public static requestABInfoWithLicenseArray([Ljava/lang/String;Z)Ljava/lang/String;
    .locals 9

    .line 1
    const-string v0, "key"

    .line 2
    .line 3
    const-string v1, "[{\"key\": \"enable_level_1_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test ab config using level-1 AB config key\"},{\"key\" : \"enable_rt_mem_report\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether using rt mem report\"},{\"key\": \"enable_amazing_rt_share\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use amazing rendertexture share mode\"},{\"key\": \"enable_new_algorithm_system_node_parallel\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable node parallel executing, true for the node parallel executing, false for the serial executing.\"},{\"key\": \"enable_new_algorithm_system_node_parallel_version\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls algorithm system node parallel version\"},{\"key\": \"enable_new_algorithm_system_node_parallel_thread_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls algorithm system node parallel thread num\"},{\"key\": \"enable_face240_small_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240\"},{\"key\": \"enable_face240_small_resolution_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for faceDetect240 V2\"},{\"key\": \"enable_face240_small_resolution_for_high_input_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use small resolution for high input resolution\"},{\"key\": \"enable_face106_large_resolution\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use large resolution for faceDetect106\"},{\"key\": \"effect_enable_facemiss_beauty_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use beauty optimization while face miss\"},{\"key\": \"enable_new_algorithm_system_native_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use CVPixelBuffer/AHardwareBuffer or glReadPixel to get pixel on iOS\"},{\"key\": \"enable_algoirthm_input_image_format_convert_in_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to convert algorithm input format from BGRA to RGBA in GPU on iOS\"},{\"key\": \"enable_face_async_model_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face CoreML async load or not\"},{\"key\": \"enable_algorithm_gpu_resize_with_buffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gpu_resize with buffer in render thread\"},{\"key\": \"enable_face_scale_smoother\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scale smoother in face module\"},{\"key\": \"face_extra_model_type\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Controls face extra model type for multi-models in face module\"},{\"key\": \"support_external_model_name\",\"dataType\": 1,\"defaultVal\": 3,\"description\": \"Support face & matting use external biz specify model name\"},{\"key\": \"enable_tt_face_extra_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_face_extra model mapping for scene\"},{\"key\": \"enable_tt_matting_model_mapping\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable tt_matting model mapping for scene\"},{\"key\": \"algorithm_model_mapping\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Set algorithm model mapping for scene\"},{\"key\":\"enable_generaleffect_rtreuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use generaleffect local chain texture reuse\"},{\"key\": \"enable_gles30_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use gles30 fence, true for using fence, false for not using fence.\"},{\"key\": \"enable_no_face_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable no face performance optimize\"},{\"key\": \"enable_schedule_vrsr\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr\"},{\"key\": \"enable_schedule_vrsr_for_segment\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr for segment\"},{\"key\": \"enable_vrsr_adaptor_for_only_render\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr adaptor for only render\"},{\"key\": \"enable_vrsr_init_async\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr init async\"},{\"key\": \"enable_schedule_vrsr_return_status\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to return vrsr status\"},{\"key\": \"enable_vrsr_algoType\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"vrsr algo type\"},{\"key\": \"enable_vrsr_downsampleOpt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable vrsr downsampleOpt\"},{\"key\": \"enable_vrsr_reset_frame_interval\",\"dataType\": 1,\"defaultVal\": 240,\"description\": \"vrsr reset interval frame count\"},{\"key\": \"enable_vrsr_vp_config\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set vrsr vp config\"},{\"key\": \"pesm_switch_render\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect render, true for using, false for not.\"},{\"key\": \"pesm_switch_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect features, true for using, false for not.\"},{\"key\": \"pesm_switch_terminal_feature\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect terminal feature, true for using, false for not.\"},{\"key\": \"pesm_switch_algorithm\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to open effect algorithm, true for using, false for not.\"},{\"key\": \"pesm_switch_frame_tools\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open frame tools, true for using, false for not.\"},{\"key\":\"enable_mv_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use mv render texture reuse\"},{\"key\":\"slam_algorithm_coexist\",\"dataType\":0,\"defaultVal\": false,\"description\": \"slam/ar_plane can coexist with other algorithms\"},{\"key\": \"enable_gl_crash_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use gl crash fix test\"},{\"key\":\"enable_feature_rt_reuse\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature render texture reuse\"},{\"key\": \"enable_amazing_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to use asset async loading in amazing engine\"},{\"key\":\"enable_feature_ge_pool\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to use feature generaleffect rt use same pool\"},{\"key\" : \"enable_faceMakeup_using_new_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether face makeup using new render engine\"},{\"key\" : \"enable_console_logging\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether printf in console output\"},{\"key\" : \"enable_build_in_sensor_service\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether use effect-sdk build in sensor service\"},{\"key\" : \"enable_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether upload applog_report\"},{\"key\": \"enable_amazing_filter_clear_by_agfx\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to clear output texture of amazing filter by AGFX API\"},{\"key\": \"enable_agfx_metalV2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable agfx metal v2 on ios\"},{\"key\": \"enable_create_texture_fail_fallback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use fallback strategy in FaceDistortionFaceu and FaceDistortionV3 when create texture fail, to skip this frame and retry to create texture in next frame.\"},{\"key\": \"enable_coexist_logic\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether the coexist logic work .\"},{\"key\": \"effect_working_color_space_linear\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls effect using linear/nolinear working color space. false: no-linear; true linear\"},{\"key\": \"enable_flipPatch_cube_3d_support\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable flipPatch\'s samplerCube and sampler3D support\"},{\"key\": \"enable_agfx_debug_layer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer\"},{\"key\": \"amazing_agfx_debug_layer_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"0-None, 1-Error, 2-Warning, 3-Info\"},{\"key\": \"enable_model_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize algorithm model loading\"},{\"key\": \"enable_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode png by OS API\"},{\"key\": \"enable_alpha_unpremul_png_decoding_by_os_api\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to decode alpha unpremultiplied png by OS API\"},{\"key\": \"enable_agfx_debug_layer_strict_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX debug layer strict mode\"},{\"key\": \"enable_agfx_texture_native_buffer_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable AGFX texture native buffer support\"},{\"key\": \"enable_async_load_anim_seq\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use async load anim seq, n(>=0) represent as async load n texture, n(<0) represent as async load all texture.\"},{\"key\": \"enable_set_external_Opacity\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable clients to set the facemakeup opacity\"},{\"key\": \"enable_horizontal_algorithm_refact\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Swap algorithmPreConfig\'s width and height in horizontal mode\"},{\"key\": \"enable_horizontal_algorithm_adapter\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Swap and compare algorithmPreConfig\'s width and height in horizontal mode for video feature manager\"},{\"key\": \"enable_javascript_in_befview\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use javascript in befview\"},{\"key\": \"enable_agfx_rendering_lib\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx rendering lib\"},{\"key\": \"enable_agfx_fence\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use agfx fence\"},{\"key\": \"enable_command_merge_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to merge blitCommand with renderCommand in agfx proxy\"},{\"key\": \"enable_texture_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture optimize in agfx proxy\"},{\"key\": \"enable_performance_optimize_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in agfx proxy\"},{\"key\": \"enable_replace_pop_push_to_resetState_in_agfx_proxy\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to replace pushstate popstate to resetstate in agfx proxy\"},{\"key\": \"enable_memory_allocator\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls when to use memory_allocator, 1 represent init time, 2 represent no effect time\"},{\"key\": \"memory_allocator_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory allocator size\uff0cusable when enable memory allocator\"},{\"key\": \"memory_allocator_unit_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls memory unit size\uff0cusable when enable memory allocator\"},{\"key\": \"use_absolute_timer\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"If true, timer use absolute chrono, else use timeStamp param-in\"},{\"key\": \"enable_infosticker_new_text_component\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"switch state for new text system.\"},{\"key\": \"effect_javascript_runtime_mode\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"set javascript runtime  mode\"},{\"key\": \"enable_imageprocessor_preload_margin\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to load sequence frame with error margin\"},{\"key\": \"enable_shadow_rt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use shadow rt, replace pingpong rt\"},{\"key\": \"enable_angle_binary_program\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable Angle binary program\"},{\"key\": \"enable_amazing_faceMakeup_performance_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable performance optimize in amazing faceMakeup\"},{\"key\": \"enable_useEffectProcessor_inner_effect\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use parallel inner effect\"},{\"key\": \"enable_useEffectProcessor_ind_context\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use parallel inner effect with two independent contexts\"},{\"key\": \"enable_process_empty_requirements_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to handle empty requirement case in pipeline processor\"},{\"key\": \"enable_mesh_recalculatebounds_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use optimized recalculateBounds func or not\"},{\"key\": \"enable_faceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable face makeup segmentation\"},{\"key\": \"enable_amgFaceMakeup_segmentation\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing face makeup segmentation\"},{\"key\": \"faceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of effect makeup type to enable segmentation\"},{\"key\": \"amgFaceMakeup_segmentation_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Control the kind of amazing effect makeup type to to enable segmentation\"},{\"key\": \"enable_shadow_pass_lazy_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable shadow pass lazy load\"},{\"key\": \"enable_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm preload or not\"},{\"key\": \"enable_bach_algorithm_preload\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload or not\"},{\"key\": \"enable_bach_algorithm_preload_seteffect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload in set effect or not\"},{\"key\": \"enable_bach_algorithm_preload_default_algorithm\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control whether to use algorithm bach async preload default algorithm or not\"},{\"key\": \"enable_befview_use_old_algorithm_result\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"control befview whether to use old algorithm result\"},{\"key\": \"enable_amazing_scene_part_manager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable amazing scene part manager\"},{\"key\": \"enable_performance_opt_in_terminal_and_general_effect_feature\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, optimize TerminalFeature and GeneralEffectFeature processing logic\"},{\"key\": \"enable_performance_opt_in_terminal_feature_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, fix optimize TerminalFeature processing logic\"},{\"key\": \"enable_algorithm_loading_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to optimize the timing of loading algorithms\"},{\"key\": \"enable_old_mv_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close old mv\"},{\"key\": \"enable_brush_offine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to close brush2D feature\"},{\"key\": \"enable_facefitting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether facetitting algorithm should perform optimization\"},{\"key\": \"swing_segment_preload_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"swing segment create with resource loading, such as material compiling, the value is a bitwise combination of SegmentType, `Segment::initSegment` explains\"},{\"key\": \"enable_handleeffectevent_sync\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether to call handleEffectEvent synchronously\"},{\"key\": \"enable_staged_job_pipeline\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to use stagedJobPipeline framework to enable algorithm/render parallel\"},{\"key\": \"staged_job_pipeline_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Strategy about staged job pipeline (thread priority, spin count, command batch, etc.) .\"},{\"key\": \"use_mp4_android_hard_codec\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable Android hardware decode for new MP4\"},{\"key\": \"enable_migrate_msg_center_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of msg center threads to AsyncKit\"},{\"key\": \"migrate_msg_center_thread_max_num\",\"dataType\": 1,\"defaultVal\": 2,\"description\": \"Controls migrating message center maximum thread number\"},{\"key\": \"enable_simd_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether is simd for web cc\"},{\"key\": \"enable_delay_thread_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether delay creation of threads for web cc\"},{\"key\": \"enable_et_data_capturing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open event tracking monitor, true for using, false for not.\"},{\"key\": \"enable_lua_script_type_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether lua type check\"},{\"key\" : \"effectab_reuse_algorithm_types\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"support reused mode algorithm types\"},{\"key\": \"enable_fs_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to open simd optimize\"},{\"key\": \"enable_remove_filter_program\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether remove filter program when deconstruct\"},{\"key\": \"bytenn_ab_test\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"bytenn ab test interface\"},{\"key\": \"enable_effect_network_url_checking\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to check validity of urls\"},{\"key\": \"enable_blitTexture_in_setInputTexture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to blitTexture in AEAlgorithm::setInputTexture\"},{\"key\": \"enable_get_rendererDevice_from_compute_engine\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to get rendererDevice from bach compute_engine\"},{\"key\": \"enable_new_avatar3d\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to use new avatar3d model\"},{\"key\": \"effectab_text_cache_opt\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether to use text cache opt\"},{\"key\": \"enable_video_animseq_copy_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mp4 raw data copy optimize\"},{\"key\": \"enable_first_frame_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open first frame statistics, true for using, false for not.\"},{\"key\": \"enable_first_frame_breakdown\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to do first frame duration breakdown, true for doing, false for not.\"},{\"key\": \"disable_shader_script_sourcePath\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Disable shader sourcePath binding with script\"},{\"key\": \"enable_dynamic_pipeline_processor_switch\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable dynamic switch of pipeline processor\"},{\"key\": \"cpu_blitter_threshold\",\"dataType\": 1,\"defaultVal\": 256,\"description\": \"cpu blitter when smaller than the threshold\"},{\"key\": \"enable_fs_use_face_threads\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if face to use threads\"},   {\"key\": \"enable_slota\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable slotA\"},{\"key\": \"enable_pngSize_adapt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable png size adapt for resolution\"},{\"key\": \"enable_ahardwareBuffer_fd_leak_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable ahardwareBuffer fd leak fix\"},{\"key\": \"enable_if_comp_shader_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable create IF shader object with cache\"},{\"key\": \"enable_getframedata_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize getFrameData wait window\"},{\"key\": \"enable_pipelineprocessor_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"optimize the pipeline processor\"},{\"key\": \"enable_sharing_JSManager\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether JSManager is shared among scripts\"},{\"key\": \"enable_set_sticker_opt\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether preload effect in first frame\"},{\"key\": \"effect_sdk_face_beauty_feature_log_level\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"setting face beauty feature log level\"},{\"key\": \"enable_transition_ii\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable new transition, which is not depend on EffectManager, or not\"},{\"key\": \"enable_skeleton_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skeleton to open optimize\"},{\"key\": \"set_log_level\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls log level\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"preload_blocklist\",\"dataType\": 3,\"defaultVal\": \"script,general_lens,cine_move,gpu_render,matting,texture_blit\",\"description\": \"Bach preload block list of algorithm type\"},{\"key\": \"enable_skin_seg_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if skin_Seg to open simd optimize\"},{\"key\": \"enable_break_old_feature_in_renderCore\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core\"},{\"key\": \"enable_break_old_feature_in_renderCore_direct_return\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"break old engine feature in render core direct return\"},{\"key\": \"main_route_sampler_interval\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Set the sampling interval for event tracking of ET_TYPE_MAIN_ROUTE_TRACKING.\"},{\"key\": \"enable_et_memory_pool\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable etMonitor memory pool.\"},{\"key\": \"enable_hairparser_use_simd_optim\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if hairparser to open simd optimize\"},{\"key\": \"matting_optimization_type\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Flag for whether matting algorithm should perform Smash, script or BCE\"},{\"key\": \"enable_use_freid_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if use freid v2\"},{\"key\": \"effectab_enable_image_quality_down_sample\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether need to enable down sample while choosing image quality mode\"},{\"key\": \"enable_gift_statistics\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to open gift event tracking, true for using, false for not.\"},{\"key\": \"enable_expand_message_post\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable expand message post scene\"},{\"key\": \"enable_track_share_effectnode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track shared effectNode strategy\"},{\"key\": \"enable_track_set_output_size\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable track use the size different from main renderChain size\"},{\"key\": \"enable_renderchain_reconstruct_main_texture\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable renderChain reconstruct\"},{\"key\": \"enable_track_enable_texture_attribute\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable_texture_attribute\"},{\"key\": \"enable_video_segment_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable swing videoSegment structural adjustment.\"},{\"key\": \"enable_segment_xshader_reuse\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable reuse of xshader in segment\"},{\"key\": \"enable_unified_midtexture_release_in_lowmemory_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable unified middle texture release in low memory mode.\"},{\"key\": \"enable_delay_bslot_effect_exclusion\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to delay mutual exclusion for b slot effect\"    },{\"key\": \"enable_fix_algorithm_resolution_change_twice\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"fix algorithm resolution change twice when input texture resolution changed.\"},{\"key\": \"enable_render_cache_string_set_license\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to set license to render cache string. key: effect_ab_license, value: license\"},{\"key\": \"new_algorithm_system_node_parallel_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"algorithm system node parallel setings\"},{\"key\": \"enable_auxiliary_texture_support_metal\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable green screen video support metal\"},{\"key\": \"enable_segment_manager_set_param_after_scene_updated\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to set param after scene updated in PrefabSegment\"},{\"key\": \"enable_segment_manager\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_async_load\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable segment manager\"},{\"key\": \"enable_segment_manager_set_picture_mode\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable segment manager set picture mode\"},{\"key\": \"enable_lock_algorithmTextureCache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to lock m_algorithmTextureCache\"},{\"key\": \"enable_mapstuck_check_in_pipeline_processor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use map stuck check in pipeline processor\"},{\"key\": \"windows_use_dx\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether use dx full link for auto color\"},{\"key\": \"enable_deltatime_negative\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether deltaTime can be a negative number\"},{\"key\": \"enable_gpu_garbage_collect\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable gpu garbage collect.\"},{\"key\": \"effect_resource_manager_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of effect resource manager\"},{\"key\": \"enable_sticker_add_user_string_value\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls the logic of adding user string value of the sticker.\"},{\"key\": \"enable_gift_send_full_link_tracking\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to post event tracking infos to gift full link platform\"},{\"key\": \"enable_rendercore_agfx_flush_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable RenderCore-AGFX glFlush optimize\"},{\"key\": \"enable_amazing_mp4_full_link_gpu\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 full link gpu\"},{\"key\": \"enable_amazing_mp4_async_decode_init\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable amazing mp4 async decode init\"},{\"key\": \"enable_composer_id_map_find_lock\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Control whether to turn on composer id map find lock\"},{\"key\": \"enable_egl_fence_in_algorithm\",\"dataType\":0,\"defaultVal\": true,\"description\": \"Controls whether to use egl fence in algorithm\"},{\"key\": \"enable_rhi_frame_reuse_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to reuse ve output in rhi\"},{\"key\": \"enable_delay_frame_ve_output\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to delay ve output frame in single thread\"},{\"key\": \"enable_sharing_JSManager_reserved\",\"dataType\":1,\"defaultVal\": 0,\"description\": \"Controls whether to reserve bach js manager\"},{\"key\": \"enable_bach_jsobject_defer_bind\",\"dataType\":0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind bach js object\"},{\"key\": \"enable_amazing_makeup_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use amazing makeup fetch.\"},{\"key\": \"enable_multi_render_device_effect_node\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable multi render device effect node, such as metal on ios\"},{\"key\": \"enable_amg_pass_pipeline_refator\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable the refactor of AMGPass pipeline\"},{\"key\": \"enable_fix_amg_transform_negative_scale\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix AMGTransform\'s negative scale\"},{\"key\": \"enable_render_system_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether enable fix dangling pointer in render system\"},{\"key\": \"enable_amazing_builtin_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable Amazing BuiltIn optimize\"},{\"key\": \"enable_framebuffer_fetch\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to enable FrameBufferFetch With New Pass\'s useFBOFetchWithBlackList\"},{\"key\": \"enable_mesh_data_dirty_check\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable mesh data dirty check[optimization(v1) found in large-scene]\"},{\"key\": \"enable_large_scene_optimize_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v2) found in large-scene\"},{\"key\": \"enable_large_scene_optimize_v4\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for enable or disable a set of optimization(v4) found in large-scene\"},{\"key\": \"enable_camera_rt_backup\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls if use backup RT to replace render input when it is same as camera RT\"},{\"key\": \"enable_jazz_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether to call jazz init in Amazer::init\"},{\"key\": \"enable_load_js_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"support loading js as cache.\"},{\"key\": \"enable_preload_jssystemscript_as_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"preload jssystemscript as cache during resource loading.\"},{\"key\": \"enable_jsobjectmanager_in_runtime\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"use jsobjectmanager to reuse jsobject in runtime\"},{\"key\": \"use_executors_v2\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using executors 2.0\"},{\"key\": \"basic_local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"basic_global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of Executors\"},{\"key\": \"local_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of local Executors used by AsyncAsset\"},{\"key\": \"enable_fix_post_event_in_on_event\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable fix postEvent in onEvent deadlock\"},{\"key\": \"use_global_executors\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether using global executors used by AsyncAsset\"},{\"key\": \"global_executors_settings\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"Settings of global Executors used by AsyncAsset\"},{\"key\": \"enable_js_shared_memory\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether js shared memory is enabled\"},{\"key\": \"enable_js_rtti_defer_binding\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to defer bind RTTI interface to JS script\"},{\"key\": \"enable_asset_async_executor\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async executor used by AsyncAsset\"},{\"key\": \"asset_async_executor_cpu_thread_nums\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Asset async load cpu thread nums used by AsyncAsset\"},{\"key\": \"asset_async_executor_enable_anim_seq\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable asset async load for anim sequence\"},{\"key\": \"enable_textsystem_init_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable textSystem init optimize\"},{\"key\": \"enable_register_js_callback\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls if we register truly existing js callback functions into lists.\"},{\"key\": \"animseq_preload_prediction_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the preload prediction strategy of animseq\"},{\"key\": \"animseq_preload_count\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the preload count of animseq\"},{\"key\": \"effectab_anim_seq_cache\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"AnimSeqCache\"},{\"key\": \"anim_seq_cache_sink_atlas\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Whether sink animSeq cache from AnimSeq to ImageAtlas\"},{\"key\": \"enable_gif_anim_seq_cache\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Cache of GifAnimSeq and GifAsset\"},{\"key\": \"enable_gif_gpu_decoding\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"GPU Decoding of GifAsset\"},{\"key\": \"enable_file_access_tracker_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Log unknown/unregistered file access originating from Lua.\"},{\"key\": \"enable_file_allow_list_lua\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Enable allow list protection for Lua\"},{\"key\": \"enable_system_optimize\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable optimize system constructor, onStart and onUpdate\"},{\"key\": \"enable_fix_async_loader_pointer2\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Async loader fix protection second patch\"},{\"key\": \"enable_migrate_async_threads\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls whether to enable the migration of async threads to AsyncKit\"},{\"key\": \"host_address_for_framedebug\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"host address for framedebug\"},{\"key\": \"enable_event_center_listener_thread_safe\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable event center listener thread safe\"},{\"key\": \"enable_video_anim_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable AMGVideoAnimSeq use vecodec\"},{\"key\": \"async_assets_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"async assets setting\"},{\"key\": \"enable_decode_png_use_vecodec\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether use vecodec decode png\"},{\"key\": \"enable_use_agfx_pipeline_props_def\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable use_agfx pipeline props define\"},{\"key\": \"enable_js_delay_release\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use delay release strategy in js\"},{\"key\": \"enable_text_sdf_cache_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split of four-channel sdf texture.\"},{\"key\": \"enable_text_blend_layer_split\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to split text blending.\"},{\"key\": \"animseq_preload_strategy\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"\"},{\"key\": \"animseq_cache_strategy\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"\"},{\"key\": \"enable_texture_sequence_preload_fix\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable texture sequence preload fix\"},{\"key\": \"enable_draw_driven_shader_build_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether enable draw driven shader building.Currently only support Mac platform.\"},{\"key\": \"lua_gc_throttle_wait_time\",\"dataType\": 1,\"defaultVal\": -1,\"description\": \"Controls the minimal interval time of lua gc in milliseconds\"},{\"key\": \"enable_scene_asset_preloader\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to enable scene asset preloader\"},{\"key\": \"enable_hdr_sticker_support\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"enable to support hdr gif and video sticker.\"},{\"key\": \"enable_system_list_load_limit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"If true, The effect package loading system-list limit is enabled when called the scene onStart.\"},{\"key\": \"effectab_device_texture_cache_size_limit\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Device texture cache size\"},{\"key\": \"enable_BACH_TEST_ab_config_key\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Test BACH AB config key\"},{\"key\": \"enable_face_extra_gpu_bce\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable face extra gpu bce link or not\"},{\"key\": \"enable_face_detect_ability_fix\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls enable face detect_ability_fix or not\"},{\"key\": \"enable_face_bce_gpu_mask\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable full GPU chain for face, mouth and teeth mask\"},{\"key\": \"enable_face_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for face extra\"},{\"key\": \"enable_matting_optimization\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Flag for whether matting algorithm should perform BCE\"},{\"key\": \"enable_idream_bce_graph\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls enable BCE compute graph for iDream\"},{\"key\": \"bce_setting\",\"dataType\": 3,\"defaultVal\": \"\",\"description\": \"BCE(Bach compute engine) settings\"},{\"key\": \"enable_bach_performance_monit\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether whether to enable performance monit in bach\"},{\"key\": \"enable_bach_performance_monit_param\",\"dataType\": 3,\"defaultVal\": \"0,100\",\"description\": \"Controls the performance monitoring probability and frequency (per val ms) \"},{\"key\": \"bach_asyn_report_delayed_frames\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of frames to be delayed when bach reports\"},{\"key\": \"bach_asyn_report_per_frame_report_size\",\"dataType\": 1,\"defaultVal\": 0,\"description\": \"Controls the number of bach reports to be reported per frame\"},{\"key\": \"enable_bach_applog_report\",\"dataType\": 0,\"defaultVal\": true,\"description\": \"Controls whether to use Applog in Bach\"},{\"key\": \"enable_bach_windows_swing_dx_sharing\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whether to use windows dx sharing\"},{\"key\": \"enable_bach_read_fp16_pixelbuffer\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls whethe to enable read fp16 cvPixelBuffer input in blit node\"},{\"key\": \"enable_script_init_async_mode\",\"dataType\": 0,\"defaultVal\": false,\"description\": \"Controls script init async or not\"}]"

    .line 4
    .line 5
    if-eqz p0, :cond_6

    .line 6
    .line 7
    array-length v2, p0

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    const/4 v2, 0x0

    .line 13
    const-string v3, "["

    .line 14
    .line 15
    move v4, v2

    .line 16
    :goto_0
    array-length v5, p0

    .line 17
    if-ge v4, v5, :cond_2

    .line 18
    .line 19
    new-instance v5, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    aget-object v3, p0, v4

    .line 28
    .line 29
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    array-length v5, p0

    .line 37
    add-int/lit8 v5, v5, -0x1

    .line 38
    .line 39
    if-eq v4, v5, :cond_1

    .line 40
    .line 41
    const-string v5, ", "

    .line 42
    .line 43
    invoke-virtual {v3, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const-string v4, "]"

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    new-instance v3, Lorg/json/JSONArray;

    .line 56
    .line 57
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 58
    .line 59
    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    :try_start_0
    new-instance p1, Lorg/json/JSONArray;

    .line 63
    .line 64
    invoke-direct {p1, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    move v1, v2

    .line 68
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-ge v1, v4, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Lorg/json/JSONObject;

    .line 79
    .line 80
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 81
    .line 82
    .line 83
    add-int/lit8 v1, v1, 0x1

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :catch_0
    move-exception p0

    .line 87
    goto :goto_4

    .line 88
    :cond_3
    move p1, v2

    .line 89
    :goto_2
    array-length v1, p0

    .line 90
    if-ge p1, v1, :cond_5

    .line 91
    .line 92
    aget-object v1, p0, p1

    .line 93
    .line 94
    new-instance v4, Lorg/json/JSONArray;

    .line 95
    .line 96
    invoke-static {v1}, Lcom/bef/effectsdk/EffectABConfig;->getABInfo(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-direct {v4, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    move v5, v2

    .line 104
    :goto_3
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    if-ge v5, v6, :cond_4

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    check-cast v6, Lorg/json/JSONObject;

    .line 115
    .line 116
    new-instance v7, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    const-string v8, "effect_config_"

    .line 122
    .line 123
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string v8, "_"

    .line 130
    .line 131
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v8

    .line 138
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v7

    .line 145
    invoke-virtual {v6, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .line 150
    .line 151
    add-int/lit8 v5, v5, 0x1

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_4
    add-int/lit8 p1, p1, 0x1

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :goto_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 158
    .line 159
    .line 160
    :cond_5
    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0

    .line 165
    :cond_6
    :goto_5
    return-object v1
.end method
